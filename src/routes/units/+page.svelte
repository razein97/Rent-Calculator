<script lang="ts">
	import Database from 'tauri-plugin-sql-api';
	import Icon from '@iconify/svelte';
	import { Button } from '$lib/components/ui/button';
	import * as Dialog from '$lib/components/ui/dialog';
	import { Input } from '$lib/components/ui/input';
	import Navbar from './navbar.svelte';
	import { goto } from '$app/navigation';
	import * as Form from '$lib/components/ui/form';
	import { superForm } from 'sveltekit-superforms/client';
	import { zodClient } from 'sveltekit-superforms/adapters';
	import { _unitSchema } from './+page.js';
	import { toast } from 'svelte-sonner';
	import type { PageData } from './$types';

	export let data: PageData;
	let units_result = data.units_result;
	let loading = false;

	let db: Database = data.db;

	const form = superForm(data.form, {
		SPA: true,
		validators: zodClient(_unitSchema),
		async onUpdate({ form }) {
			if (form.valid) {
				submitting = true;
				if (form.data.name) {
					const ins_result = await db.execute(
						'INSERT into units (unit_name, rent, property_id) VALUES ($1, $2, $3)',
						[form.data.name, form.data.rent, data.property_id]
					);

					if (ins_result.rowsAffected > 0) {
						submitting = false;
						dialogOpen = false;
						toast.success('Unit added successfully.');
						units_result = await db.select(
							`SELECT * FROM units where property_id=${data.property_id};`
						);
					} else {
						submitting = false;
						toast.error('Something went wrong. Please try again.');
					}
				}
			}
		}
	});
	const { form: formData, enhance } = form;

	let submitting = false;
	$: dialogOpen = false;
</script>

<div class="flex h-full w-full flex-col">
	<Navbar bind:dialogOpen backLink="/properties" title="Units" subtitle={data.address} />

	{#if loading}
		<div class="flex h-full w-full flex-col justify-center">
			<Icon class="mx-auto h-10 w-10" icon="line-md:loading-alt-loop" />
		</div>
	{:else}
		<div class="h-full w-full p-2">
			{#if units_result.length > 0}
				<div class="grid w-full grid-cols-4 gap-4 p-4">
					{#each units_result as unit}
						<div class="cursor-pointer transition duration-500 hover:scale-105">
							<!-- <Button
								class="absolute right-0 top-0 m-0 p-0"
								variant="outline"
								on:click={() => {
									editDialogOpen = true;
									property_id = property.id;
									form2.form.set({ name: property.name, address: property.address });
								}}>
								<Icon class="h-6 w-6" icon="ph:dots-three-outline-vertical-fill" />
							</Button> -->
							<Button
								variant="secondary"
								on:click={() => goto('/units/' + unit.id)}
								class="flex h-full  w-full flex-col">
								<Icon class=" h-10 w-10" icon="fxemoji:housebuilding" />
								<p>{unit.unit_name}</p>
							</Button>
						</div>
					{/each}
				</div>
			{:else}
				<div class="flex h-full w-full flex-col justify-center">
					<div class="flex flex-col items-center">
						<p class="text-center text-xl font-bold">No units added</p>
						<p class="text-center text-sm font-normal text-gray-500">Click to add a unit</p>
						<br />

						<Button
							class="flex h-20 w-32 flex-col rounded-md bg-primary p-4"
							on:click={() => (dialogOpen = true)}>
							<Icon class="mx-auto h-10 w-10" color="white" icon="ic:sharp-domain-add" />
							<p class="text-white">Add a unit</p>
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
			<Dialog.Title>Unit details</Dialog.Title>
			<Dialog.Description>Enter the description of the unit</Dialog.Description>
		</Dialog.Header>
		<div class="grid gap-4 py-4">
			<form method="POST" use:enhance>
				<Form.Field {form} name="name">
					<Form.Control let:attrs>
						<Form.Label>Unit Name</Form.Label>
						<Input {...attrs} bind:value={$formData.name} />
					</Form.Control>
					<Form.FieldErrors />
				</Form.Field>

				<Form.Field {form} name="rent">
					<Form.Control let:attrs>
						<Form.Label>Rent</Form.Label>
						<Input {...attrs} type="number" pattern="[0-9]" bind:value={$formData.rent} />
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
