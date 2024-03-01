// See https://kit.svelte.dev/docs/types#app
// for information about these interfaces
declare global {
	namespace App {
		// interface Error {}
		// interface Locals {}
		// interface PageData {}
		// interface Platform {}

		interface PageData {
			flash?: { type: 'success' | 'error'; message: string };
		}

		interface Locals {
			user: User | null;
		}
	}
	declare namespace svelteHTML {
		interface HTMLAttributes<T> {
			'on:clickoutside'?: (event: CustomEvent) => void;
		}
	}
}

export { };
