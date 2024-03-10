use tauri_plugin_sql::{Migration, MigrationKind};

pub const  CREATE_TABLE_PROPERTIES_SQL : tauri_plugin_sql::Migration = Migration {
    version: 1,
    description: "create_properties_table",
    sql: "CREATE TABLE properties (id INTEGER NOT NULL UNIQUE, name TEXT, address TEXT, units INTEGER, PRIMARY KEY(id AUTOINCREMENT));",
    kind: MigrationKind::Up,
};

pub const CREATE_TABLE_UNITS_SQL: tauri_plugin_sql::Migration = Migration {
    version: 2,
    description: "create_units_table",
    sql: "CREATE TABLE units(
        id INTEGER NOT NULL UNIQUE,
        property_id INT,
        unit_name TEXT,
        rent REAL,
        security_deposit REAL,
        electricity_unit REAL,
        electricity_unit_charge REAL,
        amenities TEXT,
        rented_status BOOL,
        rented_date INT,
        PRIMARY KEY(id AUTOINCREMENT)
        );",
    kind: MigrationKind::Up,
};

pub const CREATE_TABLE_TENANT_DETAILS_SQL: tauri_plugin_sql::Migration = Migration {
    version: 3,
    description: "create_tenant_det_table",
    sql: "CREATE TABLE tenant_details (
        id	INTEGER NOT NULL UNIQUE,
        property_id INTEGER,
        unit_id INTEGER,
        rent REAL,
        security_deposit REAL,
        first_name	TEXT,
        last_name	TEXT,
        street_address_1	TEXT,
        street_address_2	TEXT,
        city	TEXT,
        state	TEXT,
        postal_code	TEXT,
        country	TEXT,
        phone_home	TEXT,
        phone_work	TEXT,
        phone_emergency	TEXT,
        email	TEXT,
        notes	TEXT,
        profile_photos	TEXT,
        documents	TEXT,
        amenities TEXT,
        in_date	INTEGER,
        out_date	INTEGER,
        is_checked_out BOOL,
        PRIMARY KEY(id AUTOINCREMENT)
    );",
    kind: MigrationKind::Up,
};

pub const CREATE_TABLE_TRANSACTIONS_SQL: tauri_plugin_sql::Migration = Migration {
    version: 4,
    description: "create_transactions_table",
    sql: "CREATE TABLE transactions (
        id	INTEGER NOT NULL UNIQUE,
        property_id	INTEGER,
        unit_id	INTEGER,
        date_created	INTEGER,
        due_date INTEGER,
        current_electricity_unit	REAL,
        previous_electricity_unit	REAL,
        amenities TEXT,
        amenitites_charge REAL,
        tenants	TEXT,
        electricity_cost	REAL,
        rent_amount	REAL,
        extra_charges TEXT,
        total_cost	REAL,
        status BOOL,
        PRIMARY KEY(id AUTOINCREMENT)
    );",
    kind: MigrationKind::Up,
};

pub const CREATE_TABLE_RENT_AMOUNT_SQL: tauri_plugin_sql::Migration = Migration {
    version: 5,
    description: "create_rent_amount_table",
    sql: "CREATE TABLE units_rents (
        id	INTEGER NOT NULL UNIQUE,
        property_id	INTEGER,
        unit_id	INTEGER,
        rent_amount	REAL,
        date	INTEGER,
        PRIMARY KEY(id AUTOINCREMENT)
    );",
    kind: MigrationKind::Up,
};

pub const  CREATE_TABLE_AMENITIES_SQL : tauri_plugin_sql::Migration = Migration {
    version: 1,
    description: "create_amenities_table",
    sql: "CREATE TABLE amenities (id INTEGER NOT NULL UNIQUE, amenity TEXT, price REAL,  PRIMARY KEY(id AUTOINCREMENT));",
    kind: MigrationKind::Up,
};
