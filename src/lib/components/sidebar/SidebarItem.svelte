<script lang="ts">
	import { goto, invalidateAll } from '$app/navigation';
	import { page } from '$app/stores';

	import { navbarTitle } from '$lib/components/stores/navbar';
	import { sidebarState } from '$lib/components/stores/navbar';
	import Icon from '@iconify/svelte';
	export let itemUrl: string;
	export let itemName: string;
	export let itemIcon: string;
</script>

<button
	class={`${
		$page.url.pathname === itemUrl ? 'bg-black  ' : 'bg-white hover:bg-gray-200'
	} relative p-4 hover:cursor-pointer`}
	on:click={() => {
		goto(itemUrl);

		sidebarState.set(false);
	}}
>
	<div class="flex flex-row items-center px-5">
		<Icon
			class={`${$page.url.pathname === itemUrl ? 'bg-black' : ''} mx-4`}
			style={$page.url.pathname === itemUrl ? 'color: #FFFFFF' : 'color: #61676c'}
			width="1.5em"
			height="1.5em"
			icon={itemIcon}
		/>
		<p
			class={`${
				$page.url.pathname === itemUrl ? 'font-bold text-white ' : 'font-medium text-gray-600'
			}    `}
		>
			{itemName}
		</p>
	</div>
</button>
