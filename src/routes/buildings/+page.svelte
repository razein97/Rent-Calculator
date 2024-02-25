<script lang="ts">
	import { onMount } from 'svelte';
	import type { PageData } from './$types';
	import Database from 'tauri-plugin-sql-api';
	import Icon from '@iconify/svelte';
	import { Button } from '$lib/components/ui/button';

	export let data: PageData;

	let building_result;
	let loading = true;

	onMount(async () => {
		const db = await Database.load('sqlite:rc.db');

		// const ins_result = await db.execute(
		// 	'INSERT into buildings (id, name, address, units) VALUES ($1, $2, $3, $4)',
		// 	[1, 'testing', 'here', 10]
		// );

		building_result = await db.select('SELECT * FROM buildings;');
		loading = false;
		console.log(building_result.length);
	});
</script>

<div class="flex h-screen w-full p-2">
	{#if loading}
		<div class="flex h-full w-full flex-col justify-center">
			<Icon class="mx-auto h-10 w-10" icon="line-md:loading-alt-loop" />
		</div>
	{:else}
		<div class="flex h-full w-full flex-col justify-center">
			<p class="p-2 text-2xl font-black">Manage your buildings here.</p>
			{#if building_result.length > 0}
				<div class="grid grid-cols-4 gap-4 rounded-sm border py-4">
					{#each building_result as building}
						<div class="container">
							<Button variant="outline" class="flex h-full w-full flex-col">
								<Icon class="mx-auto h-10 w-10" icon="fluent-emoji-flat:office-building" />
								<p>{building.name}</p>
							</Button>
						</div>
					{/each}
				</div>
			{:else}
				<div>Empty sucker</div>
			{/if}
		</div>
	{/if}
</div>
