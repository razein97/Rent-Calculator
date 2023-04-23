<script lang="ts">
	export let width: String;
	export let errMessage: String;
	export let fieldValue: string;
	export let fieldType: string;
	export let fieldName: string;
	export let labelText: string;
	import 'iconify-icon';
</script>

<div class={`flex ${width}  flex-col`}>
	<div class="relative">
		<input
			class={`${
				errMessage.length > 0
					? 'focus:border-2 focus:border-red-400'
					: 'focus:border-2 focus:border-blue-400'
			} peer block w-full rounded-md border border-gray-400 px-2.5  pb-2.5 pt-5 text-sm text-gray-900 outline-none focus:ring-0`}
			type={fieldType ?? ''}
			name={fieldName ?? ''}
			value={fieldValue ?? ''}
			placeholder=" "
		/>

		<label
			for={labelText}
			class={`${
				errMessage.length > 0 ? 'peer-focus:text-red-600' : 'peer-focus:text-blue-600'
			} pointer-events-none absolute left-2.5 top-4 z-10 origin-[0] -translate-y-4 scale-75 transform text-sm text-gray-500 duration-300 peer-placeholder-shown:translate-y-0 peer-placeholder-shown:scale-100 peer-focus:-translate-y-4 peer-focus:scale-75 `}
		>
			{labelText}
		</label>
	</div>
	<div class="flex flex-row items-center">
		<iconify-icon
			class={`${errMessage.length > 0 ? '' : 'hidden'}  mr-1  mt-1  text-xs text-red-600`}
			color="red"
			icon="bi:exclamation-circle"
		/>

		<p class="mt-1 text-xs text-red-600">{errMessage}</p>
	</div>
</div>
