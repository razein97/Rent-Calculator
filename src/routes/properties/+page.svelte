<script lang="ts">
	import { onMount } from 'svelte';
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
	import { _propertySchema } from './+page.js';
	import { toast } from 'svelte-sonner';

	export let data: PageData;

	let properties_result: unknown;
	let loading = true;

	let db: Database = data.db;

	onMount(async () => {
		// const ins_result = await db.execute(
		// 	'INSERT into buildings (id, name, address, units) VALUES ($1, $2, $3, $4)',
		// 	[1, 'testing', 'here', 10]
		// );

		properties_result = await db.select('SELECT * FROM properties;');
		loading = false;
	});

	const form = superForm(data.form, {
		SPA: true,
		validators: zodClient(_propertySchema),
		async onUpdate({ form }) {
			if (form.valid) {
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
							loading = false;
							dialogOpen = false;
							toast.success('Property added successfully.');
							properties_result = await db.select('SELECT * FROM properties;');
						} else {
							loading = false;
							toast.error('Something went wrong. Please try again.');
						}
					}
				}
			}
		}
	});
	const { form: formData, enhance } = form;

	///Inputs

	let submitting = false;
	$: dialogOpen = false;

	async function handleSubmit() {}
</script>

<div class="flex h-full w-full flex-col">
	<Navbar bind:dialogOpen backLink="/" title="Properties" subtitle="Manage your properties here" />
	{#if loading}
		<div class="flex w-full flex-col justify-center">
			<Icon class="mx-auto h-10 w-10" icon="line-md:loading-alt-loop" />
		</div>
	{:else}
		<div class="p-2">
			{#if properties_result.length > 0}
				<div class="grid w-full grid-cols-4 gap-4 p-4">
					{#each properties_result as property}
						<div class="cursor-pointer transition duration-500 hover:scale-105">
							<Button variant="secondary" class="flex h-full  w-full flex-col">
								<Icon class=" h-10 w-10" icon="fluent-emoji-flat:office-building" />
								<p>{property.name}</p>
							</Button>
						</div>
					{/each}
				</div>
			{:else}
				<div class="flex flex-col items-center">
					<p class="text-center text-xl font-bold">No properties added</p>
					<p class="text-center text-sm font-normal text-gray-500">Click to add a property</p>
					<br />

					<Button
						class="h-full w-full rounded-md border bg-primary p-4"
						on:click={() => (dialogOpen = true)}
						><Icon class="mx-auto h-10 w-10" color="white" icon="ic:sharp-domain-add" />
						<p class="text-white">Add a property</p></Button
					>
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

				<Form.Button class="w-full">Submit</Form.Button>
			</form>
		</div>
		<Dialog.Footer>
			<Button type="button" class="w-full" on:click={() => handleSubmit()}>
				{#if submitting}
					<Icon class="mx-auto h-10 w-10 p-2" icon="line-md:loading-twotone-loop" />
				{:else}
					<p>Save changes</p>
				{/if}
			</Button>
		</Dialog.Footer>
	</Dialog.Content>
</Dialog.Root>
