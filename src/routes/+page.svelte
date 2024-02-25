<script lang="ts">
	import { onMount } from 'svelte';
	import type { PageData } from './$types';
	import Database from 'tauri-plugin-sql-api';
	import Icon from '@iconify/svelte';
	import { Button } from '$lib/components/ui/button';

	export let data: PageData;

	let loading = true;

	onMount(async () => {});
</script>

<div class="flex h-screen w-full p-2">
	<Button href="/buildings" class="flex h-full w-full flex-col border">
		<Icon class="mx-auto h-10 w-10" icon="fluent-emoji-flat:office-building" />
		<p>Go to buildings</p>
	</Button>
</div>
