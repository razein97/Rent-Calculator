import { superValidate } from 'sveltekit-superforms/client';
import { zod } from 'sveltekit-superforms/adapters';
import { z } from 'zod';
import Database from 'tauri-plugin-sql-api';

export const _propertySchema = z.object({

    name: z.string().min(2),
    address: z.string(),
    number: z.string().default('0'),
});


export const _editPropertySchema = z.object({

    name: z.string().min(2),
    address: z.string(),
});

export const load = async () => {

    const db = await Database.load('sqlite:rc.db');

    const properties_result = await db.select('SELECT * FROM properties;');


    const form = await superValidate(zod(_propertySchema));
    const form2 = await superValidate(zod(_editPropertySchema));

    return { form, form2, db, properties_result };
};