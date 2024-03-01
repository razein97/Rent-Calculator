<script lang="ts">
	import '../app.pcss';
	import type { LayoutData } from './$types';
	import { Toaster } from 'svelte-sonner';
	import { page } from '$app/stores';
	import { beforeNavigate } from '$app/navigation';
	import { getFlash } from 'sveltekit-flash-message/client';
	import SideBarMain from '$lib/components/sidebar/SideBarMain.svelte';

	export let data: LayoutData;
</script>

<Toaster richColors closeButton />

<div class="grid" data-sveltekit-preload-data="false">
	<!-- <SideBarMain /> -->
	<!-- <DrawerMenu {showUserMenu} /> -->

	<div class="h-screen min-h-screen !scroll-smooth">
		<slot />
	</div>
</div>
