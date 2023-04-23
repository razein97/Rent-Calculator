<script lang="ts">
	import { user_profile_modals } from '$lib/constants/enum';
	import { readAndCompressImage } from 'browser-image-resizer';
	import { fade } from 'svelte/transition';

	export let showModal: user_profile_modals;
	export let savingImage = false;

	let fileInput: HTMLElement;
	let inputImage: string;
	let files: any;
	let loadingImage = false;

	const config = {
		quality: 0.9,
		maxWidth: 1200,
		maxHeight: 675,
		debug: false,
		mimeType: 'image/webp'
	};

	async function mutateImage(img: any) {
		loadingImage = true;
		readAndCompressImage(img, config).then((value) => {
			const reader = new FileReader();
			reader.readAsDataURL(value);
			reader.onload = (event) => {
				if (reader.result) {
					inputImage = reader.result.toString();
				}
			};

			loadingImage = false;
		});
	}

	async function saveImage() {
		if (inputImage) {
			savingImage = true;
			const data = { image: '' };
			const imgData = inputImage.split(',');
			data.image = imgData[1];
			console.log(JSON.stringify(data));

			//TODO: Send up the data
			savingImage = false;
		}
	}
</script>

<div
	transition:fade={{ duration: 150 }}
	class="fixed z-[999] h-screen w-full bg-black bg-opacity-50 backdrop-blur-sm  ">
	<div
		id="modal-body"
		class="top-1/2 mx-auto w-11/12 translate-y-1/2 rounded-md bg-white sm:w-[512px]">
		<div class="flex flex-col items-center gap-y-2  p-2">
			{#if inputImage}
				<div class="flex h-60 w-full justify-end rounded bg-gray-200">
					<img class=" h-full w-full  object-cover" src={inputImage} alt="" />
					<div class="fixed h-12  bg-black bg-opacity-50 p-2 hover:bg-red-600">
						<button disabled={savingImage} on:click={() => (inputImage = '')} class="">
							<iconify-icon
								class=""
								style={'color: #fff'}
								width="1.7em"
								height="2em"
								icon="ri:delete-bin-5-fill" />
						</button>
					</div>
				</div>
			{:else}
				<div class="flex h-60 w-full items-center justify-center rounded bg-gray-200">
					{#if loadingImage}
						<div
							class="h-8 w-8 animate-spin rounded-full border-4 border-solid border-blue-700 border-y-white" />
					{:else}
						<button on:click={() => fileInput.click()} class="h-10  w-1/3  bg-slate-100">
							<input
								class="hidden"
								type="file"
								accept=".png, .jpg, .jpeg"
								id="file_to_upload"
								bind:this={fileInput}
								bind:files
								on:change={() => mutateImage(files[0])} />
							<p class="">Upload an image</p>
						</button>
					{/if}
				</div>
			{/if}

			<div class="flex w-full flex-row justify-around">
				<button
					class={`${
						savingImage ? 'bg-red-900 text-gray-100' : 'bg-red-500 text-white'
					} h-10 w-1/3 rounded `}
					disabled={savingImage}
					on:click={() => (showModal = user_profile_modals.NONE)}>Cancel</button>

				<button
					class="flex h-10 w-1/3  justify-center rounded bg-green-600 text-white"
					on:click={() => {
						if (!savingImage) {
							saveImage();
						}
					}}>
					{#if savingImage}
						<div
							class="my-auto h-6 w-6  animate-spin rounded-full border-4 border-solid border-green-600 border-y-white" />
					{:else}
						<p class="my-auto">Save</p>
					{/if}
				</button>
			</div>
		</div>
	</div>
</div>
