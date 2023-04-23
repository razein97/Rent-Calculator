// API Url
export class ApiURL {
	static API_BASE_URL = 'http://lawappa.com:5000';
	static API_SIGNUP_URL = this.API_BASE_URL + '/user/signup';
	static API_LOGIN_URL = this.API_BASE_URL + '/user/login';
	static API_LOGOUT_URL = this.API_BASE_URL + '/user/logout';
	static API_GOOGLE_OAUTH_URL = this.API_BASE_URL + '/oauth/google';
	static API_FORGOT_PASSWORD_URL = this.API_BASE_URL + '/user/forgot_password';
	static API_RESET_PASSWORD_URL = this.API_BASE_URL + '/user/reset_password';
	static API_VERIFY_EMAIL = this.API_BASE_URL + '/email/verify_email';
}

// UserUrl
export class UserURL {
	static USER_URL = '/user';
	static DASHBOARD_URL = this.USER_URL + '/dashboard';
	static SITE_URL = this.USER_URL + '/site';
	static POSTS_URL = this.USER_URL + '/posts';
	static NEW_POST_URL = this.USER_URL + '/post-editor';
	static DRAFT_URL = this.USER_URL + '/posts?type=draft';
	static SCHEDULED_POST_URL = this.USER_URL + '/posts?type=scheduled';
	static PUBLISHED_POST_URL = this.USER_URL + '/posts?type=published';
	static USER_PROFILE_URL = this.USER_URL + '/user_profile';
	static DEFAULT_USER_PROFILE_PICTURE = 'https://cdn-icons-png.flaticon.com/512/3237/3237472.png';
	static DEFAULT_USER_COVER_PICTURE =
		'https://images.pexels.com/photos/2471234/pexels-photo-2471234.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';
}

//Oauth Url
export class OauthURL {
	static GOOGLE_OAUTH_REDIRECT_URL = '/auth/oauth/google';
}

//Auth url
export class AuthURL {
	static AUTH_URL = '/auth';
	static LOGIN_URL = this.AUTH_URL + '/login';
	static SIGNUP_URL = this.AUTH_URL + '/signup';
	static PASSWORD_RESET_URL = this.AUTH_URL + '/password_reset';
	static FORGOT_PASSWORD_URL = this.AUTH_URL + '/forgot_password';
}

//Misc URL
export class MiscURL {
	static TOS_URL = '/tos';
	static PRIVACY_URL = '/privacy_policy';
	static COOKIES_URL = '/cookie_use';
	static HELP_CENTER_URL = '/help';
}
