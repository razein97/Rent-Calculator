<script lang="ts">
	import '../app.pcss';
	import type { LayoutData } from './$types';
	import { Toaster } from 'svelte-sonner';
	import { page } from '$app/stores';
	import { beforeNavigate } from '$app/navigation';
	import { getFlash } from 'sveltekit-flash-message/client';

	export let data: LayoutData;
</script>

<Toaster richColors closeButton />

<div class="grid">
	<Navbar />
	<!-- <DrawerMenu {showUserMenu} /> -->

	<div class="h-screen min-h-screen !scroll-smooth lg:ml-72">
		<slot />
	</div>
</div>
