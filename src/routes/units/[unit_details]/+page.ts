import { superValidate } from 'sveltekit-superforms/client';
import { zod } from 'sveltekit-superforms/adapters';
import { z } from 'zod';
import Database from 'tauri-plugin-sql-api';



export const load = async ({ params }) => {

    const db = await Database.load('sqlite:rc.db');
    const unit_id = params.unit_details;



    const unit_result = await db.select(`SELECT * FROM units WHERE id = ${unit_id};`);
    const unit_address = await db.select(`SELECT address FROM properties WHERE id = ${unit_result[0].property_id};`);

    // const address = unit_address[0].address;


    // const request = await fetch(
    //     `https://jsonplaceholder.typicode.com/users/${id}`
    // );
    // if (request.status >= 400) throw error(request.status);

    // const userData = await request.json();
    // const form = await superValidate(zod(_unitSchema));

    return { db, unit_result, unit_address };
};