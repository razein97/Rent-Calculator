#![cfg_attr(
    all(not(debug_assertions), target_os = "windows"),
    windows_subsystem = "windows"
)]

use tauri_plugin_sql::TauriSql;

fn main() {
    tauri::Builder::default()
        .plugin(TauriSql::default())
        .run(tauri::generate_context!())
        .expect("error while running tauri application");
}

// async fn create_db() {
//     let db_url: String = String::from("sqlite://appData.db");
//     let home_path = dirs_next::home_dir().unwrap();
//     let path: String = String::from(home_path.to_string_lossy());
//     let joined_path = Path::new(&path).join(db_url);
//     let joined_path_string = String::from(joined_path.as_path());
//     if !joined_path.exists() {
//         Sqlite::create_database(&joined_path_string).await.unwrap();
//     }
// }
