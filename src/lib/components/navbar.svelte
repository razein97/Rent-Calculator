<script lang="ts">
	import { sidebarState } from '$lib/components/stores/navbar';

	import Icon from '@iconify/svelte';
	import Button from './ui/button/button.svelte';
	import { goto } from '$app/navigation';

	export let title: string;
	export let subtitle: string;
	export let backLink: string;
</script>

<header
	class="sticky top-0 z-30 flex h-14 w-full flex-row items-center justify-between bg-black p-4"
>
	<Button
		class=""
		on:click={() => {
			goto(backLink, { replaceState: true });
		}}
	>
		<Icon style={'color: white'} width="1.5em" height="1.5em" icon="ep:back" />
	</Button>

	<div class="flex flex-col items-center">
		<p class=" text-lg font-bold text-white">{title}</p>
		{#if subtitle}
			<p class=" text-xs font-bold text-gray-500">{subtitle}</p>
		{/if}
	</div>

	<div class="flex items-center justify-end">
		<button
			on:click={() => {
				sidebarState.set(true);
			}}
		>
			<Icon style={'color: #FFF'} width="1.5em" height="1.5em" icon="tabler:menu-2" />
		</button>
	</div>
</header>
