<script lang="ts">
	import { page } from '$app/stores';
	import { clickOutside } from '$lib/utilities/click_outside';
	import { sidebarState } from '$lib/components/stores/navbar';
	import SidebarItem from './SidebarItem.svelte';

	let postOpen: boolean = true;
	let makeHidden: boolean = false;
</script>

<div
	use:clickOutside
	on:clickoutside={() => {
		sidebarState.set(false);
	}}
	class={` ${
		$sidebarState ? 'translate-x-0' : 'translate-x-full'
	} fixed right-0 top-0 z-30 w-3/4 border-r bg-white transition-all duration-500 md:w-72 lg:left-0 lg:w-72 lg:translate-x-0`}
>
	<div class="flex h-screen flex-col border">
		<!-- logo -->

		<!-- sidebar body -->
		<section class="flex flex-col justify-between text-sm lg:text-base">
			<SidebarItem itemUrl={''} itemName="Dashboard" itemIcon="ph:squares-four-fill" />

			<span class="p-2" />

			<!-- <li
				class={`${
					$page.route.id === ChamberURL.POSTS_URL ? 'bg-black' : ' hover:bg-gray-100'
				} flex flex-row items-center p-2`}
			>
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
						$page.route.id === ChamberURL.POSTS_URL ? '' : 'hover:bg-gray-300'
					} ml-2 flex items-center`}
				>
					<Icon
						class={`${postOpen ? 'rotate-0' : '-rotate-90'}  transition-transform
                    duration-500`}
						width="1.35em"
						height="1.35em"
						style={$page.route.id === ChamberURL.POSTS_URL ? 'color: #FFF' : 'color: #61676c'}
						icon="ic:round-keyboard-arrow-down"
					/>
				</button>

				<a href={ChamberURL.POSTS_URL} class="flex w-full flex-row">
					<div class="flex flex-row items-center">
						<Icon
							class="px-1.5"
							style={$page.route.id === ChamberURL.POSTS_URL ? 'color: #FFF' : 'color: #61676c'}
							width="1.35em"
							height="1.4em"
							icon="ph:note-pencil-light"
						/>
						<p
							class={`${
								$page.route.id === ChamberURL.POSTS_URL
									? 'font-bold text-white'
									: 'font-medium text-gray-600'
							} px-3 `}
						>
							Posts
						</p>
					</div>
					<button
						class={`${
							$page.route.id === ChamberURL.POSTS_URL ? 'hover:bg-gray-700' : 'hover:bg-gray-300'
						} ml-20 rounded-full`}
					>
						<a href={ChamberURL.NEW_POST_URL} class="group relative flex">
							<Icon
								width="1.5em"
								height="1.5em"
								style={$page.route.id === ChamberURL.POSTS_URL ? 'color: #FFF' : 'color: #61676c'}
								icon="ic:baseline-plus"
							/>
							<span
								class="absolute left-1/2 m-5 mx-auto w-20 -translate-x-1/2 translate-y-full rounded-md bg-gray-800 px-2
                         text-gray-100 opacity-0 transition-opacity group-hover:opacity-100 group-hover:delay-500"
							>
								New Post
							</span>
						</a>
					</button>
				</a>
			</li> -->

			<!-- <ul class={`${makeHidden ? 'hidden' : ''} flex  flex-col transition-all `}>
				<a href={ChamberURL.DRAFT_URL}>
					<li
						class={`${
							postOpen ? '' : 'opacity-0 delay-300'
						} px-[85px] py-1.5 transition-all  duration-150 hover:bg-gray-100`}
					>
						<p
							class={`${
								$page.url.pathname + $page.url.search === ChamberURL.DRAFT_URL
									? 'font-bold text-black'
									: 'font-medium text-gray-600'
							}  `}
						>
							Drafts
						</p>
					</li>
				</a>
				<a href={ChamberURL.SCHEDULED_POST_URL}>
					<li
						class={`${
							postOpen ? 'delay-150' : 'opacity-0 delay-150 '
						} px-[85px] py-1.5 transition-all  duration-150 hover:bg-gray-100`}
					>
						<p
							class={`${
								$page.url.pathname + $page.url.search === ChamberURL.SCHEDULED_POST_URL
									? 'font-bold text-black'
									: 'font-medium text-gray-600'
							}  `}
						>
							Scheduled
						</p>
					</li>
				</a>
				<a href={ChamberURL.PUBLISHED_POST_URL}>
					<li
						class={`${
							postOpen ? 'delay-300' : 'opacity-0'
						} px-[85px] py-1.5 transition-all duration-150 hover:bg-gray-100`}
					>
						<p
							class={`${
								$page.url.pathname + $page.url.search === ChamberURL.PUBLISHED_POST_URL
									? 'font-bold text-black'
									: 'font-medium text-gray-600'
							} `}
						>
							Published
						</p>
					</li>
				</a>
			</ul> -->
		</section>
	</div>
</div>
