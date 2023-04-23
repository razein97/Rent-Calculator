<script lang="ts">
	import 'iconify-icon';
	export let icon: string;
	export let iconColor: string;
	export let message: string;
</script>

<div class="flex flex-row items-center">
	<iconify-icon {icon} color={iconColor} class="mt-1 mr-1" />
	<p style="color: {iconColor}" class="font-medium">
		{message}
	</p>
</div>
