<script>
	import { AuthURL } from '$lib/constants/urls';
	import 'iconify-icon';
</script>

<header class="sticky top-0 z-30 flex h-14 w-full items-center justify-between bg-black p-4">
	<div class="flex items-center justify-center md:w-1/5">
		<a href="/">
			<div class="relative h-10 w-10 cursor-pointer opacity-75 transition hover:opacity-100">
				<img class="bg-black" src="https://i.ibb.co/HXp8468/lawnest-logo-512.png" alt="logo" />
			</div>
		</a>
	</div>

	<div class="hidden flex-1 items-center justify-center space-x-8 text-white md:flex">
		<a href="/" class="">Link 1</a>
		<a href="/" class="">Link 2</a>
		<a href="/" class="">Link 3</a>
		<a href="/" class="">Link 4</a>
	</div>

	<div class="flex  justify-center gap-x-4 md:w-1/5">
		<iconify-icon
			height="1.7em"
			width="1.7em"
			class=" hover:cursor-pointer"
			style="color:white"
			icon="material-symbols:search-rounded" />
		<a href={AuthURL.LOGIN_URL}>
			<iconify-icon
				height="1.5em"
				width="1.5em"
				icon="teenyicons:user-circle-solid"
				class="hover:cursor-pointer"
				style="color:white" />
		</a>
	</div>
</header>
