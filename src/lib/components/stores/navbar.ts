import { writable } from 'svelte/store';

export const sidebarState = writable(false);
export const navbarTitle = writable({ title: '' });
