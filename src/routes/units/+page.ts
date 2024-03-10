import { superValidate } from 'sveltekit-superforms/client';
import { zod } from 'sveltekit-superforms/adapters';
import { z } from 'zod';
import Database from 'tauri-plugin-sql-api';

export const _unitSchema = z.object({

    name: z.string().min(2),
    rent: z.custom<number>()
        .refine((value) => value ?? false, "Required")
        .refine((value) => Number.isFinite(Number(value)), "Invalid number")
        .transform((value) => Number(value))




});

export const load = async ({ url }) => {

    const db = await Database.load('sqlite:rc.db');
    const property_id = url.searchParams.get('id');



    const units_result = await db.select(`SELECT * FROM units WHERE property_id = ${property_id};`);
    const unit_address = await db.select(`SELECT address FROM properties WHERE id = ${property_id};`);

    const address = unit_address[0].address;


    // const request = await fetch(
    //     `https://jsonplaceholder.typicode.com/users/${id}`
    // );
    // if (request.status >= 400) throw error(request.status);

    // const userData = await request.json();
    const form = await superValidate(zod(_unitSchema));

    return { form, db, units_result, address, property_id };
};