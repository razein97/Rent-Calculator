<script lang="ts">
	import 'iconify-icon';
	import InputField from '$lib/components/signup_in/InputField.svelte';
	import type { PageData } from './$types';
	import { getGoogleUrl } from '$lib/utilities/get_google_url';
	import { AuthURL, UserURL } from '$lib/constants/urls';
	import { superForm } from 'sveltekit-superforms/client';
	import { boolean } from 'zod';

	export let data: PageData;

	const { form, enhance, errors, allErrors } = superForm(data.form, {
		errorSelector: '[data-invalid]',
		autoFocusOnError: 'detect',
		multipleSubmits: 'prevent'
	});

	// export let form: ActionData;
	let showPassword = false;
	let loading = false;
</script>

<div class="flex h-screen w-full flex-grow justify-center bg-white">
	<div
		class="mx-0 my-auto flex h-3/4 w-11/12 flex-col border bg-white px-3 py-5 shadow-sm sm:w-[448px] sm:px-12 md:w-[448px] md:px-12 lg:w-[448px] lg:px-12 xl:w-[448px] xl:px-12 2xl:w-[448px] 2xl:px-12"
	>
		<h2 class="text-3xl font-bold">Sign in</h2>
		<br />

		{#if false}
			<div class="rounded-md bg-red-400">
				<p class="text-center font-semibold text-white">
					Sorry, your password was incorrect. Please double-check your password.
				</p>
			</div>
		{/if}
		<br />

		<!-- sign in fields -->
		<form method="POST" use:enhance class="flex flex-col content-evenly gap-4">
			<InputField
				width="w-full"
				errMessage={$errors?.email?.[0] ?? ''}
				fieldType="email"
				fieldName="email"
				fieldValue={$form?.email ?? ''}
				labelText="Email"
			/>

			<!-- password field -->
			<div class="relative flex">
				<InputField
					width="w-full"
					errMessage={''}
					fieldType={showPassword ? 'text' : 'password'}
					fieldName="password"
					labelText="Password"
					fieldValue={$form?.password ?? ''}
				/>

				<button
					class="absolute right-0 mr-3 self-center"
					type="button"
					name="showPassword"
					on:click={() => (showPassword = !showPassword)}
				>
					{#if showPassword}
						<iconify-icon height="1.3em" width="1.3em" icon="ph:eye-slash-light" />
					{:else}
						<iconify-icon height="1.3em" width="1.3em" icon="ph:eye-light" />
					{/if}
				</button>
			</div>

			<!-- cant sign in  -->
			<a href={AuthURL.FORGOT_PASSWORD_URL}
				><p class="cursor-pointer text-right text-xs text-blue-700 hover:underline">
					Can&apos;t sign in?
				</p></a
			>

			<!-- buttons -->
			<button
				class="flex w-full items-center justify-center rounded-md bg-blue-600 py-2 text-white duration-300 hover:bg-blue-500"
				type="submit"
				name="submit"
			>
				{#if loading}
					<div
						class=" h-8 w-8 animate-spin rounded-full border-4 border-solid border-blue-700 border-y-white"
					/>
				{:else}
					<p class="text-base">Login</p>
				{/if}
			</button>
		</form>

		<!-- sign in with social -->
		<!-- <div class="mt-6 grid grid-cols-3 items-center text-gray-400">
			<hr class="border-gray-400" />
			<p class="text-center text-sm">OR</p>
			<hr class="border-gray-400" />
		</div> -->

		<!-- <a
			href={getGoogleUrl(UserURL.USER_URL)}
			class="mt-5 flex w-full items-center justify-center rounded-md border border-gray-400 bg-white py-2 text-sm text-blue-700 hover:border-blue-600"
		>
			<iconify-icon height="1.5em" width="1.5em" class="px-2" icon="logos:google-icon" />
			Sign in with Google
		</a> -->
		<!-- <button
				class="mt-3 flex w-full items-center justify-center rounded-md border border-gray-400 bg-white py-2 text-sm text-blue-700">
				<iconify-icon height="2em" width="2em" class="px-2" icon="logos:apple" />
				Sign in with Apple
			</button> -->

		<!-- register  -->
		<!-- <div class="mt-4 flex items-center justify-between text-xs text-[#3a3b3d]">
			<p>Don&apos;t have an account?</p>
			<a href={AuthURL.SIGNUP_URL}>
				<p class="cursor-pointer text-blue-700 hover:underline">Register</p>
			</a>
		</div> -->
	</div>
</div>
