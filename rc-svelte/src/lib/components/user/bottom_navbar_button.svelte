<script lang="ts">
	export let icon: string;
	export let label: string;
	export let selected: boolean;
</script>

<button
	on:click
	class={`${
		selected ? 'bg-black' : 'bg-white'
	}  flex h-full  w-[20%]  cursor-pointer flex-col items-center  rounded-md p-2`}>
	<iconify-icon
		style={selected ? 'color:#FFFFFF ' : 'color: #000000'}
		width="1.2em"
		height="1.2em"
		{icon} />
	<p class={`${selected ? 'text-white' : 'text-gray-600'} text-center text-xs`}>
		{label}
	</p>
</button>
