<script lang="ts">
	import { sidebarState } from '$lib/components/stores/navbar';

	import Icon from '@iconify/svelte';
	import Button from '$lib/components/ui/button/button.svelte';
	import { goto } from '$app/navigation';

	export let title: string;
	export let subtitle: string;
	export let backLink: string;
	export let dialogOpen: boolean;
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
		<Button on:click={() => (dialogOpen = true)}>
			<Icon style={'color: #FFF'} width="1.5em" height="1.5em" icon="ic:round-plus" />
		</Button>
	</div>
</header>
