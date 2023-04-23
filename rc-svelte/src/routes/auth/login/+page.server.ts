import { ApiURL, UserURL } from '$lib/constants/urls';
import { loginSchema } from '$lib/utilities/validation_schemas';
import { fail, redirect } from '@sveltejs/kit';
import type { IResult } from 'ua-parser-js';
import UAParser from 'ua-parser-js';
import type { Actions, PageServerLoad } from './$types';
import { superValidate } from 'sveltekit-superforms/server';
import { boolean } from 'zod';

export const load: PageServerLoad = async ({ cookies }) => {
	const form = await superValidate(loginSchema);
	const session = cookies.get('SESSION');
	if (session !== undefined) {
		throw redirect(302, '/dashboard');
	}
	return { form };
};

export const actions = {
	default: async ({ request, cookies }) => {
		const form = await superValidate(request, loginSchema);
		if (!form.valid) {
			return fail(400, { form });
		} else {
			const parsedUA: IResult = UAParser(request.headers.get('user-agent')?.toString() ?? '');
			const response = await fetch(ApiURL.API_LOGIN_URL, {
				mode: 'cors',
				method: 'POST',
				credentials: 'include',
				body: JSON.stringify({
					email: form.data.email,
					password: form.data.password,
					browser_name: parsedUA.browser.name ?? '',
					device_model: parsedUA.device.model ?? '',
					device_type: parsedUA.device.type ?? '',
					device_vendor: parsedUA.device.vendor ?? '',
					os_name: parsedUA.os.name ?? '',
					os_version: parsedUA.os.version ?? ''
				}),

				headers: { 'Content-Type': 'application/json' }
			});

			if (response.status === 200) {
				const session = await response.json();
				cookies.set('SID', session.sid, {
					path: '/',
					httpOnly: true,
					sameSite: 'strict',
					secure: false,
					maxAge: 60 * 60 * 24 * 30
				});

				cookies.set('USER', '1', {
					path: '/',
					httpOnly: true,
					sameSite: 'strict',
					secure: false,
					maxAge: 60 * 60 * 24 * 30
				});

				throw redirect(303, UserURL.DASHBOARD_URL);
			} else if (response.status == 401) {
				return fail(401, { form, user: false });
			} else {
				return fail(500);
			}
		}

		return { form };
	}
};

// export const actions: Actions = {
// 	login: async ({ request, fetch, cookies }) => {
// 		const formData = await request.formData();
// 		const result = loginSchema.safeParse(formData);
// 		if (!result.success) {
// 			const data = {
// 				data: Object.fromEntries(formData),
// 				errors: result.error.flatten().fieldErrors
// 			};

// 			return fail(401, data);
// 		} else {
// 			const parsedUA: IResult = UAParser(request.headers.get('user-agent')?.toString() ?? '');
// 			const response = await fetch(ApiURL.API_LOGIN_URL, {
// 				mode: 'cors',
// 				method: 'POST',
// 				credentials: 'include',
// 				body: JSON.stringify({
// 					email: formData.get('email'),
// 					password: formData.get('password'),
// 					browser_name: parsedUA.browser.name ?? '',
// 					device_model: parsedUA.device.model ?? '',
// 					device_type: parsedUA.device.type ?? '',
// 					device_vendor: parsedUA.device.vendor ?? '',
// 					os_name: parsedUA.os.name ?? '',
// 					os_version: parsedUA.os.version ?? ''
// 				}),

// 				headers: { 'Content-Type': 'application/json' }
// 			});

// 			if (response.status === 200) {
// 				const session = await response.json();
// 				cookies.set('SID', session.sid, {
// 					path: '/',
// 					httpOnly: true,
// 					sameSite: 'strict',
// 					secure: false,
// 					maxAge: 60 * 60 * 24 * 30
// 				});

// 				cookies.set('USER', '1', {
// 					path: '/',
// 					httpOnly: true,
// 					sameSite: 'strict',
// 					secure: false,
// 					maxAge: 60 * 60 * 24 * 30
// 				});

// 				throw redirect(303, UserURL.DASHBOARD_URL);
// 			} else if (response.status == 401) {
// 				const newFormData: FormData = formData;
// 				const unauthorized = {
// 					data: Object.fromEntries(newFormData),
// 					user: true
// 				};
// 				return fail(401, unauthorized);
// 			} else {
// 				return fail(500);
// 			}
// 		}
// 	}
// };
