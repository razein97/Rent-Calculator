import { OauthURL } from '$lib/constants/urls';

export function getGoogleUrl(from: string) {
	const rootUrl = 'https://accounts.google.com/o/oauth2/v2/auth';
	let envVar = import.meta.env.VITE_GOOGLE_OAUTH_CLIENT_ID;

	const options = {
		redirect_uri: OauthURL.GOOGLE_OAUTH_REDIRECT_URL as string,
		client_id: envVar,
		access_type: 'offline',
		response_type: 'code',
		prompt: 'consent',
		scope: [
			'https://www.googleapis.com/auth/userinfo.profile',
			'https://www.googleapis.com/auth/userinfo.email'
		].join(' '),
		state: from
	};

	const qs = new URLSearchParams(options);

	return `${rootUrl}?${qs.toString()}`;
}
