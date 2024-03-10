<script lang="ts">
	import * as DropdownMenu from '$lib/components/ui/dropdown-menu/index.js';
	import type { PageData } from '../properties/$types';
	import Database from 'tauri-plugin-sql-api';
	import Icon from '@iconify/svelte';
	import { Button, buttonVariants } from '$lib/components/ui/button';
	import * as Dialog from '$lib/components/ui/dialog';
	import { Input } from '$lib/components/ui/input';
	import { Label } from '$lib/components/ui/label';
	import Navbar from './navbar.svelte';
	import { goto } from '$app/navigation';
	import * as Form from '$lib/components/ui/form';
	import { superForm } from 'sveltekit-superforms/client';
	import { zodClient } from 'sveltekit-superforms/adapters';
	import { _editPropertySchema, _propertySchema } from './+page.js';
	import { toast } from 'svelte-sonner';

	export let data: PageData;

	let properties_result = data.properties_result;
	let loading = false;

	let db: Database = data.db;

	let property_id = 0;

	const form = superForm(data.form, {
		SPA: true,
		validators: zodClient(_propertySchema),
		async onUpdate({ form }) {
			if (form.valid) {
				submitting = true;
				if (form.data.name && form.data.address && form.data.number) {
					if (!Number.isNaN(parseInt(form.data.number))) {
						let pUnits = parseInt(form.data.number);
						const ins_result = await db.execute(
							'INSERT into properties (name, address, units) VALUES ($1, $2, $3)',
							[form.data.name, form.data.address, pUnits]
						);

						if (ins_result.rowsAffected > 0) {
							for (let i = 0; i < pUnits; i++) {
								let unit_name = `Unit No. ${i + 1}`;
								await db.execute('INSERT into units (property_id, unit_name) VALUES ($1, $2)', [
									ins_result.lastInsertId,
									unit_name
								]);
							}
							submitting = false;
							dialogOpen = false;
							toast.success('Property added successfully.');
							properties_result = await db.select('SELECT * FROM properties;');
						} else {
							submitting = false;
							toast.error('Something went wrong. Please try again.');
						}
					}
				}
			}
		}
	});
	const { form: formData, enhance: enhance } = form;

	const form2 = superForm(data.form2, {
		SPA: true,
		validators: zodClient(_editPropertySchema),
		async onUpdate({ form }) {
			if (form.valid) {
				submitting = true;

				const ins_result = await db.execute(
					'UPDATE properties SET  name = $1, address= $2 WHERE id=$3',
					[form.data.name, form.data.address, property_id]
				);

				if (ins_result.rowsAffected > 0) {
					submitting = false;
					editDialogOpen = false;
					property_id = 0;
					toast.success('Property updated successfully.');
					properties_result = await db.select('SELECT * FROM properties;');
				} else {
					property_id = 0;
					submitting = false;
					toast.error('Something went wrong. Please try again.');
				}
			}
		}
	});

	const { form: formData1, enhance: enhance1 } = form2;

	let submitting = false;
	$: dialogOpen = false;
	$: deleteDialogOpen = false;
	$: editDialogOpen = false;
</script>

<div class="flex h-full w-full flex-col">
	<Navbar bind:dialogOpen backLink="/" title="Properties" subtitle="Manage your properties here" />

	{#if loading}
		<div class="flex h-full w-full flex-col justify-center">
			<Icon class="mx-auto h-10 w-10" icon="line-md:loading-alt-loop" />
		</div>
	{:else}
		<div class="h-full w-full p-2">
			{#if properties_result.length > 0}
				<div class="grid w-full grid-cols-4 gap-4 p-4">
					{#each properties_result as property}
						<div class="cursor-pointer transition duration-500 hover:scale-105">
							<div class="flex">
								<span class="w-3/4 bg-slate-500" />
								<div class="w-1/4">
									<DropdownMenu.Root closeOnItemClick>
										<DropdownMenu.Trigger class="absolute rounded-md border p-2 hover:bg-white">
											<Icon class="h-6 w-6" icon="ph:dots-three-outline-vertical-fill" />
										</DropdownMenu.Trigger>
										<DropdownMenu.Content class="w-40">
											<DropdownMenu.Group>
												<DropdownMenu.Item>
													<Button
														class="h-8 w-full text-left"
														variant="ghost"
														size="icon"
														on:click={() => {
															editDialogOpen = true;
															property_id = property.id;
															form2.form.set({ name: property.name, address: property.address });
														}}>
														<div class="flex w-full flex-row items-center justify-between">
															<Icon class="" icon="ic:round-edit" />
															<p>Edit Property</p>
														</div>
													</Button>
												</DropdownMenu.Item>

												<DropdownMenu.Separator />
												<DropdownMenu.Item>
													<Button
														class="h-8 w-full text-left"
														variant="ghost"
														size="icon"
														on:click={() => {
															deleteDialogOpen = true;
															property_id = property.id;
														}}>
														<div class="flex w-full flex-row items-center justify-between">
															<Icon class="" icon="mingcute:close-line" />
															<p class="text-red-600">Delete Property</p>
														</div>
													</Button>
												</DropdownMenu.Item>
											</DropdownMenu.Group>
										</DropdownMenu.Content>
									</DropdownMenu.Root>
								</div>
							</div>

							<Button
								variant="secondary"
								on:click={() => goto('/units?id=' + property.id)}
								class="flex h-full w-full flex-col">
								<Icon class="h-10 w-10" icon="fxemoji:cityscape" />
								<p>{property.name}</p>
							</Button>
						</div>
					{/each}
				</div>
			{:else}
				<div class="flex h-full w-full flex-col justify-center">
					<div class="flex flex-col items-center">
						<p class="text-center text-xl font-bold">No properties added</p>
						<p class="text-center text-sm font-normal text-gray-500">Click to add a property</p>
						<br />

						<Button
							class="flex h-20 w-32 flex-col rounded-md bg-primary p-4"
							on:click={() => (dialogOpen = true)}>
							<Icon class="mx-auto h-10 w-10" color="white" icon="ic:sharp-domain-add" />
							<p class="text-white">Add a property</p>
						</Button>
					</div>
				</div>
			{/if}
		</div>
	{/if}
</div>

<Dialog.Root bind:open={dialogOpen}>
	<Dialog.Content class="sm:max-w-[425px]">
		<Dialog.Header>
			<Dialog.Title>Property details</Dialog.Title>
			<Dialog.Description>Enter the description of the property</Dialog.Description>
		</Dialog.Header>
		<div class="grid gap-4 py-4">
			<form method="POST" use:enhance>
				<Form.Field {form} name="name">
					<Form.Control let:attrs>
						<Form.Label>Name</Form.Label>
						<Input {...attrs} bind:value={$formData.name} />
					</Form.Control>
					<Form.FieldErrors />
				</Form.Field>

				<Form.Field {form} name="address">
					<Form.Control let:attrs>
						<Form.Label>Address</Form.Label>
						<Input {...attrs} bind:value={$formData.address} />
					</Form.Control>
					<Form.FieldErrors />
				</Form.Field>
				<Form.Field {form} name="number">
					<Form.Control let:attrs>
						<Form.Label>Number of units</Form.Label>
						<Input type="number" min="0" {...attrs} bind:value={$formData.number} />
					</Form.Control>
					<Form.FieldErrors />
				</Form.Field>

				<Form.Button class="mt-2 w-full">
					{#if submitting}
						<Icon class="mx-auto h-10 w-10 p-2" icon="line-md:loading-twotone-loop" />
					{:else}
						<p>Save changes</p>
					{/if}
				</Form.Button>
			</form>
		</div>
	</Dialog.Content>
</Dialog.Root>

<Dialog.Root bind:open={editDialogOpen}>
	<Dialog.Content class="sm:max-w-[425px]">
		<Dialog.Header>
			<Dialog.Title>Edit Property details</Dialog.Title>
			<Dialog.Description>Enter the description of the property</Dialog.Description>
		</Dialog.Header>
		<div class="grid gap-4 py-4">
			<form method="POST" use:enhance1>
				<Form.Field form={form2} name="name">
					<Form.Control let:attrs>
						<Form.Label>Name</Form.Label>
						<Input {...attrs} bind:value={$formData1.name} />
					</Form.Control>
					<Form.FieldErrors />
				</Form.Field>

				<Form.Field form={form2} name="address">
					<Form.Control let:attrs>
						<Form.Label>Address</Form.Label>
						<Input {...attrs} bind:value={$formData1.address} />
					</Form.Control>
					<Form.FieldErrors />
				</Form.Field>

				<Form.Button class="mt-2 w-full">
					{#if submitting}
						<Icon class="mx-auto h-10 w-10 p-2" icon="line-md:loading-twotone-loop" />
					{:else}
						<p>Save changes</p>
					{/if}
				</Form.Button>
			</form>
		</div>
	</Dialog.Content>
</Dialog.Root>

<Dialog.Root bind:open={deleteDialogOpen}>
	<Dialog.Content class="sm:max-w-[425px]">
		<Dialog.Header>
			<Dialog.Title>Delete Property</Dialog.Title>
			<Dialog.Description>Are You Sure??</Dialog.Description>
		</Dialog.Header>
		<div class="flex flex-row justify-around">
			<Button variant="outline" on:click={() => (deleteDialogOpen = false)}>Cancel</Button>
			<Button
				variant="destructive"
				on:click={async () => {
					submitting = true;
					const ins_result = await db.execute('DELETE FROM properties WHERE id=$1', [property_id]);

					if (ins_result.rowsAffected > 0) {
						submitting = false;
						deleteDialogOpen = false;
						property_id = 0;
						toast.success('Property deleted successfully.');
						properties_result = await db.select('SELECT * FROM properties;');
					} else {
						property_id = 0;

						submitting = false;

						toast.error('Something went wrong. Please try again.');
					}
				}}>
				{#if submitting}
					<Icon class="mx-auto h-10 w-10 p-2" icon="line-md:loading-twotone-loop" />
				{:else}
					<p>Yes, Delete</p>
				{/if}
			</Button>
		</div>
	</Dialog.Content>
</Dialog.Root>
