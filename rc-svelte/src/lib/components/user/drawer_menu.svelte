<script lang="ts">
	import { ApiURL, MiscURL, UserURL } from '$lib/constants/urls';
	import { clickOutside } from '$lib/utilities/click_outside';
	export let showUserMenu: boolean;
</script>

<div
	use:clickOutside={'menu-button'}
	on:clickoutside={() => {
		showUserMenu = false;
	}}>
	<ul
		class={`${
			showUserMenu ? '' : 'hidden'
		} absolute top-[70px] left-2 z-30 flex w-[70%] flex-col rounded border bg-white drop-shadow transition-all duration-200  sm:w-[46%] md:w-[293px] lg:w-[358px] `}>
		<li class="flex flex-row px-8 py-3">
			<iconify-icon
				class=""
				style={'color: #61676c'}
				width="3em"
				height="3em"
				icon="teenyicons:user-circle-solid" />

			<div class="flex flex-col pl-4">
				<p class=" text-lg font-semibold">Name</p>
				<p class=" text-gray-600">user@email.com</p>
			</div>
		</li>
		<hr class=" p-0" />
		<li class="mt-2 py-2 px-8 hover:bg-gray-100">
			<a on:click={() => (showUserMenu = false)} href={UserURL.USER_PROFILE_URL}>
				<p
					class=" text-sm text-gray-600
						">
					Your Profile
				</p>
			</a>
		</li>
		<li class="mt-2 py-2 px-8 hover:bg-gray-100">
			<a on:click={() => (showUserMenu = false)} href={MiscURL.HELP_CENTER_URL}>
				<p class=" text-sm text-gray-600">Help Center</p>
			</a>
		</li>

		<hr class="p-0" />

		<li class="mt-2 py-2 px-8 hover:bg-gray-100">
			<a href={ApiURL.API_SIGNOUT_URL}>
				<p class=" text-sm text-gray-600">Sign Out</p>
			</a>
		</li>
		<span class="py-1" />
	</ul>
</div>
