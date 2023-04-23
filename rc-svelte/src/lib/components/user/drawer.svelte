<script lang="ts">
	import { page } from '$app/stores';
	import { UserURL } from '$lib/constants/urls';
	import { clickOutside } from '$lib/utilities/click_outside';

	export let showUserMenu: boolean;
	export let sidebarOpen: boolean;
	let postOpen: boolean = true;
	let makeHidden: boolean = false;
</script>

<div
	use:clickOutside
	on:clickoutside={() => {
		sidebarOpen = false;
	}}
	class={` ${
		sidebarOpen ? 'translate-x-0' : '-translate-x-full'
	} fixed top-0 left-0 z-[29]  w-3/4 border-r bg-white transition-all  duration-500 sm:w-1/2 md:w-72 md:translate-x-0 lg:w-96 lg:translate-x-0`}>
	<div class="flex h-screen flex-col">
		<!-- logo -->
		<div class="flex flex-row items-center justify-around ">
			<div class="flex h-20 items-center justify-center ">
				<!-- <img
					class="h-8 w-8 rounded-md  bg-black"
					src="https://i.ibb.co/HXp8468/lawnest-logo-512.png"
					alt="logo" /> -->
				<p class="mx-2  text-3xl font-black">Lawappa</p>
			</div>

			<button
				id="menu-button"
				on:click={() => {
					showUserMenu = !showUserMenu;
				}}
				title="Profile"
				class="flex h-8  flex-row items-center rounded-full  hover:bg-gray-100">
				<iconify-icon
					class=""
					style={'color: #61676c'}
					width="2em"
					height="2em"
					icon="teenyicons:user-circle-solid" />
			</button>
		</div>

		<!-- sidebar body -->
		<section class="flex flex-col justify-between overflow-y-auto pb-16 text-sm lg:text-base">
			<ul class="mt-0">
				<li
					class={`${
						$page.url.pathname === UserURL.DASHBOARD_URL
							? 'bg-black '
							: 'md:bg-white md:hover:bg-gray-100'
					} relative p-2 hover:cursor-pointer`}>
					<a href={UserURL.DASHBOARD_URL}>
						<div class="flex flex-row items-center px-5">
							<iconify-icon
								class={`${$page.url.pathname === UserURL.DASHBOARD_URL ? 'bg-black' : ''} mx-4`}
								style={$page.url.pathname === UserURL.DASHBOARD_URL
									? 'color: #FFFFFF'
									: 'color: #61676c'}
								width="1.35em"
								height="1.4em"
								icon="iconoir:home" />
							<p
								class={`${
									$page.url.pathname === UserURL.DASHBOARD_URL
										? 'font-bold text-white '
										: 'font-medium text-gray-600'
								}    `}>
								Dashboard
							</p>
						</div>
					</a>
				</li>
				<li
					class={`${
						$page.route.id === UserURL.SITE_URL ? 'bg-black' : 'md:bg-white md:hover:bg-gray-100'
					} relative p-2 hover:cursor-pointer`}>
					<a href={UserURL.SITE_URL}>
						<div class="flex flex-row items-center px-5">
							<iconify-icon
								class={`${$page.url.pathname === UserURL.SITE_URL ? 'bg-black' : ''} mx-4  `}
								style={$page.url.pathname === UserURL.SITE_URL
									? 'color: #FFFFFF'
									: 'color: #61676c'}
								width="1.35em"
								height="1.4em"
								icon="fluent-mdl2:website" />
							<p
								class={`${
									$page.url.pathname === UserURL.SITE_URL
										? 'font-bold text-white '
										: 'font-medium text-gray-600'
								}   `}>
								View Site
							</p>
						</div>
					</a>
				</li>
			</ul>
			<span class="p-2 " />

			<li
				class={`${
					$page.route.id === UserURL.POSTS_URL ? 'bg-black' : ' hover:bg-gray-100'
				} flex flex-row items-center p-2`}>
				<button
					title="Show posts sub-menu"
					on:click={() => {
						postOpen = !postOpen;
						if (postOpen) {
							makeHidden = false;
						} else {
							setTimeout(() => (makeHidden = true), 400);
						}
					}}
					class={`${
						$page.route.id === UserURL.POSTS_URL ? '' : 'hover:bg-gray-300'
					} ml-2 flex items-center`}>
					<iconify-icon
						class={`${postOpen ? 'rotate-0' : '-rotate-90'}  transition-transform
                    duration-500`}
						width="1.35em"
						height="1.35em"
						style={$page.route.id === UserURL.POSTS_URL ? 'color: #FFF' : 'color: #61676c'}
						icon="ic:round-keyboard-arrow-down" />
				</button>

				<a href={UserURL.POSTS_URL} class="flex w-full flex-row">
					<div class="flex flex-row items-center">
						<iconify-icon
							class="px-1.5"
							style={$page.route.id === UserURL.POSTS_URL ? 'color: #FFF' : 'color: #61676c'}
							width="1.35em"
							height="1.4em"
							icon="ph:note-pencil-light" />
						<p
							class={`${
								$page.route.id === UserURL.POSTS_URL
									? 'font-bold text-white'
									: 'font-medium text-gray-600'
							} px-3 `}>
							Posts
						</p>
					</div>
					<button
						class={`${
							$page.route.id === UserURL.POSTS_URL ? 'hover:bg-gray-700' : 'hover:bg-gray-300'
						} ml-20 rounded-full`}>
						<a href={UserURL.NEW_POST_URL} class="group relative flex">
							<iconify-icon
								width="1.5em"
								height="1.5em"
								style={$page.route.id === UserURL.POSTS_URL ? 'color: #FFF' : 'color: #61676c'}
								icon="ic:baseline-plus" />
							<span
								class="absolute left-1/2 m-5 mx-auto w-20 -translate-x-1/2 translate-y-full rounded-md bg-gray-800 px-2 
                         text-gray-100 opacity-0 transition-opacity group-hover:opacity-100 group-hover:delay-500">
								New Post
							</span>
						</a>
					</button>
				</a>
			</li>

			<ul class={`${makeHidden ? 'hidden' : ''} flex  flex-col transition-all `}>
				<a href={UserURL.DRAFT_URL}>
					<li
						class={`${
							postOpen ? '' : 'opacity-0 delay-300'
						} px-[85px] py-1.5 transition-all  duration-150 hover:bg-gray-100`}>
						<p
							class={`${
								$page.url.pathname + $page.url.search === UserURL.DRAFT_URL
									? 'font-bold text-black'
									: 'font-medium text-gray-600'
							}  `}>
							Drafts
						</p>
					</li>
				</a>
				<a href={UserURL.SCHEDULED_POST_URL}>
					<li
						class={`${
							postOpen ? 'delay-150' : 'opacity-0 delay-150 '
						} px-[85px] py-1.5 transition-all  duration-150 hover:bg-gray-100`}>
						<p
							class={`${
								$page.url.pathname + $page.url.search === UserURL.SCHEDULED_POST_URL
									? 'font-bold text-black'
									: 'font-medium text-gray-600'
							}  `}>
							Scheduled
						</p>
					</li>
				</a>
				<a href={UserURL.PUBLISHED_POST_URL}>
					<li
						class={`${
							postOpen ? 'delay-300' : 'opacity-0'
						} px-[85px] py-1.5 transition-all duration-150 hover:bg-gray-100`}>
						<p
							class={`${
								$page.url.pathname + $page.url.search === UserURL.PUBLISHED_POST_URL
									? 'font-bold text-black'
									: 'font-medium text-gray-600'
							} `}>
							Published
						</p>
					</li>
				</a>
			</ul>
		</section>
	</div>
</div>
