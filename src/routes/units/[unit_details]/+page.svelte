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
	import { toast } from 'svelte-sonner';
	import * as Table from '$lib/components/ui/table/index.js';
	import type { PageData } from './$types';

	export let data: PageData;
	let unit_result = data.unit_result[0];
	let loading = false;

	let backPathname = document.referrer;

	let db: Database = data.db;

	// const form = superForm(data.form, {
	// 	SPA: true,
	// 	validators: zodClient(_unitSchema),
	// 	async onUpdate({ form }) {
	// 		if (form.valid) {
	// 			submitting = true;
	// 			if (form.data.name) {
	// 				const ins_result = await db.execute(
	// 					'INSERT into units (unit_name, rent, property_id) VALUES ($1, $2, $3)',
	// 					[form.data.name, form.data.rent, data.property_id]
	// 				);

	// 				if (ins_result.rowsAffected > 0) {
	// 					submitting = false;
	// 					dialogOpen = false;
	// 					toast.success('Unit added successfully.');
	// 					units_result = await db.select(
	// 						`SELECT * FROM units where property_id=${data.property_id};`
	// 					);
	// 				} else {
	// 					submitting = false;
	// 					toast.error('Something went wrong. Please try again.');
	// 				}
	// 			}
	// 		}
	// 	}
	// });
	// const { form: formData, enhance } = form;

	let submitting = false;
	$: dialogOpen = false;
</script>

<div class="flex h-full w-full flex-col">
	<Navbar
		bind:dialogOpen
		backLink={backPathname}
		title={unit_result.unit_name}
		subtitle={data.unit_address[0].address} />

	{#if loading}
		<div class="flex h-full w-full flex-col justify-center">
			<Icon class="mx-auto h-10 w-10" icon="line-md:loading-alt-loop" />
		</div>
	{:else if unit_result.rented_status !== true}
		<div class=" p-4">
			<div class="flex w-full flex-col space-y-2 rounded-md bg-blue-50 p-4">
				<div class="flex flex-row space-x-2">
					<p class="font-bold">Name:</p>
					<p>{unit_result.unit_name}</p>
				</div>
				<hr />
				<div class="flex flex-row space-x-2">
					<p class="font-bold">Address:</p>
					<p>{data.unit_address[0].address}</p>
				</div>
				<hr />
				<div class="flex flex-row space-x-2">
					<p class="font-bold">Rent:</p>
					<p>{unit_result.rent ?? '0.00'}</p>
				</div>
				<hr />
				<div class="flex flex-row space-x-2">
					<p class="font-bold">Electricity Unit Charge:</p>
					<p>{unit_result.electricity_unit_charge ?? '0.00'}</p>
				</div>
				<hr />
				<div class="flex flex-row space-x-2">
					<p class="font-bold">Amenities:</p>
					<!-- TODO Implement the amenities stuufff -->
					<p></p>
				</div>
				<hr />
				<div class="flex flex-row items-center justify-between space-x-2">
					<p class="font-bold">Rented Status:</p>
					<p class="font-semibold text-green-700 underline">NOT RENTED / AVAILABLE</p>
					<Button variant="default" class="self-end">Rent Now</Button>
				</div>
			</div>
			<br />

			<div class="flex flex-col items-center justify-center rounded-md bg-green-50 p-2">
				<p class="text-center">No transactions to display</p>
				<Button variant="link" class="self-center">View unit history</Button>
			</div>
		</div>
	{:else}
		<div>
			<Table.Root>
				<Table.Caption>A list of your recent invoices.</Table.Caption>
				<Table.Header>
					<Table.Row>
						<Table.Head class="w-[100px]">Invoice</Table.Head>
						<Table.Head>Status</Table.Head>
						<Table.Head>Method</Table.Head>
						<Table.Head class="text-right">Amount</Table.Head>
					</Table.Row>
				</Table.Header>
				<Table.Body>
					<Table.Row>
						<Table.Cell class="font-medium">INV001</Table.Cell>
						<Table.Cell>Paid</Table.Cell>
						<Table.Cell>Credit Card</Table.Cell>
						<Table.Cell class="text-right">$250.00</Table.Cell>
					</Table.Row>
				</Table.Body>
			</Table.Root>
		</div>
	{/if}
</div>
<!-- 
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
</Dialog.Root> -->
