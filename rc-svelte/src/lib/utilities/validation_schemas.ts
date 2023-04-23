import { z } from 'zod';
import { zfd } from 'zod-form-data';

export const signUpSchema = zfd
	.formData({
		firstName: z.string().min(1, { message: 'Enter a first name' }),
		lastName: z.string().min(1, { message: 'Enter a last name' }),
		email: z.string().email({ message: 'Enter a valid email address' }),
		password: z
			.string()
			.regex(new RegExp('.*[A-Z].*'), ' One uppercase character')
			.regex(new RegExp('.*[a-z].*'), ' One lowercase character')
			// .regex(new RegExp('.*\\d.*'), 'One number')
			.regex(
				new RegExp('.*[`~<>?,./!@#$%^&*()\\-_+="\'|{}\\[\\];:\\\\].*'),
				' One special character'
			)
			.min(8, ' 8 characters in length'),
		cnfPassword: z.string()
	})
	.superRefine(({ cnfPassword, password }, ctx) => {
		if (cnfPassword !== password) {
			ctx.addIssue({
				code: 'custom',
				message: 'The passwords did not match',
				path: ['cnfPassword']
			});
		}
	});

export const loginSchema = z.object({
	email: z.string().email({ message: 'Enter a valid email address' }),
	password: z.string().min(1, { message: 'Password cannot be empty' })
});

export const resetPasswordSchema = zfd
	.formData({
		password: z
			.string()
			.regex(new RegExp('.*[A-Z].*'), ' One uppercase character')
			.regex(new RegExp('.*[a-z].*'), ' One lowercase character')
			// .regex(new RegExp('.*\\d.*'), 'One number')
			.regex(
				new RegExp('.*[`~<>?,./!@#$%^&*()\\-_+="\'|{}\\[\\];:\\\\].*'),
				' One special character'
			)
			.min(8, ' 8 characters in length'),
		cnfPassword: z.string()
	})
	.superRefine(({ cnfPassword, password }, ctx) => {
		if (cnfPassword !== password) {
			ctx.addIssue({
				code: 'custom',
				message: 'The passwords did not match',
				path: ['cnfPassword']
			});
		}
	});
