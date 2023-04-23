// export function clickOutside(node: HTMLElement) {
// 	function detect({ target }: MouseEvent) {
// 		if (!node.contains(target as Node)) {
// 			node.dispatchEvent(new CustomEvent('clickoutside'));
// 		}
// 	}
// 	document.addEventListener('click', detect, { passive: true, capture: true });
// 	return {
// 		destroy() {
// 			document.removeEventListener('click', detect);
// 		}
// 	};
// }

export function clickOutside(node: HTMLElement, opts?: string) {
	function detect({ target }: MouseEvent) {
		if (opts !== undefined) {
			const ignore = document.getElementById(opts);
			if (ignore?.contains(target as Node)) return;

			if (!node.contains(target as Node)) {
				node.dispatchEvent(new CustomEvent('clickoutside'));
			}
		} else {
			if (!node.contains(target as Node)) {
				node.dispatchEvent(new CustomEvent('clickoutside'));
			}
		}
	}
	document.addEventListener('click', detect, { passive: true, capture: true });
	return {
		destroy() {
			document.removeEventListener('click', detect);
		}
	};
}
