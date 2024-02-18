<script lang="ts">
	import { onMount } from 'svelte';
	import type { PageData } from './$types';
	import Database from 'tauri-plugin-sql-api';

	export let data: PageData;

	onMount(async () => {
		const db = await Database.load('sqlite:rc.db');
	});
</script>

<p>hello</p>
