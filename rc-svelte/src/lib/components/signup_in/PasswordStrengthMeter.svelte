<script lang="ts">
	export let password: string;
	import { passwordStrength } from 'check-password-strength';
	import CautionLabel from './CautionLabel.svelte';
	import getPasswordStrength from '../../utilities/password_strength/mod';

	function CompleximityCalc(nScore: Number) {
		// let sComplexity = '';
		let color = 'bg-red-600';

		/* Determine complexity based on overall score */
		if (nScore > 100) {
			nScore = 100;
		} else if (nScore < 0) {
			nScore = 0;
		}
		if (nScore >= 0 && nScore < 20) {
			// sComplexity = 'Very Weak';
			color = 'bg-red-600';
		} else if (nScore >= 20 && nScore < 40) {
			// sComplexity = 'Weak';
			color = 'bg-orange-500';
		} else if (nScore >= 40 && nScore < 60) {
			// sComplexity = 'Good';
			color = 'bg-amber-400';
		} else if (nScore >= 60 && nScore < 80) {
			// sComplexity = 'Strong';
			color = 'bg-lime-600';
		} else if (nScore >= 80 && nScore <= 100) {
			// sComplexity = 'Very Strong';
			color = 'bg-emerald-600';
		}

		return color;
	}
</script>

<div class=" mt-2   flex-col">
	<div class="h-2.5 w-full rounded-md bg-gray-300">
		<div
			style="width: {getPasswordStrength(password)}%;"
			class={`h-2.5 rounded-md ${CompleximityCalc(getPasswordStrength(password))}`} />
	</div>

	<p class="mt-2  text-sm">Your password must have:</p>
	<CautionLabel
		icon={'material-symbols:check-circle-outline-rounded'}
		iconColor={password.length >= 8 ? 'green' : 'gray'}
		message={'8 or more characters'} />
	<CautionLabel
		icon={'material-symbols:check-circle-outline-rounded'}
		iconColor={passwordStrength(password).contains.includes('lowercase') &&
		passwordStrength(password).contains.includes('uppercase')
			? 'green'
			: 'gray'}
		message={'upper & lowercase letters'} />
	<CautionLabel
		icon={'material-symbols:check-circle-outline-rounded'}
		iconColor={passwordStrength(password).contains.includes('symbol') ? 'green' : 'gray'}
		message={'a special character'} />
</div>
