import { error } from '@sveltejs/kit';
import { superValidate } from 'sveltekit-superforms/client';
import { zod } from 'sveltekit-superforms/adapters';
import { z } from 'zod';
import Database from 'tauri-plugin-sql-api';

export const _propertySchema = z.object({

    name: z.string().min(2),
    address: z.string(),
    number: z.string().default('0'),
});

export const load = async ({ params, fetch }) => {

    const db = await Database.load('sqlite:rc.db');
    // const id = parseInt(params.id);

    // const request = await fetch(
    //     `https://jsonplaceholder.typicode.com/users/${id}`
    // );
    // if (request.status >= 400) throw error(request.status);

    // const userData = await request.json();
    const form = await superValidate(zod(_propertySchema));

    return { form, db };
};