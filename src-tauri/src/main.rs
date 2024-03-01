// Prevents additional console window on Windows in release, DO NOT REMOVE!!
#![cfg_attr(not(debug_assertions), windows_subsystem = "windows")]

use migration::{
    CREATE_TABLE_PROPERTIES_SQL, CREATE_TABLE_RENT_AMOUNT_SQL, CREATE_TABLE_TENANT_DETAILS_SQL,
    CREATE_TABLE_TRANSACTIONS_SQL, CREATE_TABLE_UNITS_SQL,
};

mod migration;

fn main() {
    tauri::Builder::default()
        .plugin(
            tauri_plugin_sql::Builder::default()
                .add_migrations(
                    "sqlite:rc.db",
                    vec![
                        CREATE_TABLE_PROPERTIES_SQL,
                        CREATE_TABLE_RENT_AMOUNT_SQL,
                        CREATE_TABLE_TENANT_DETAILS_SQL,
                        CREATE_TABLE_UNITS_SQL,
                        CREATE_TABLE_TRANSACTIONS_SQL,
                    ],
                )
                .build(),
        )
        .run(tauri::generate_context!())
        .expect("error while running tauri application");
}
