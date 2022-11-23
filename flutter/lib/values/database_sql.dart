const createTableBuildings = ('''CREATE TABLE buildings(
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    name TEXT,
                    address TEXT,
                    units INT
                    );''');

const createTableUnits = ('''CREATE TABLE units(
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    building_id INT,
                    unit_name TEXT,
                    tenant_ids TEXT,
                    electricity_unit REAL,
                    rent REAL,
                    amenities TEXT,
                    rented_status BOOL
                    );''');

const createTableTenantDetails = ('''
CREATE TABLE "tenant_details" (
	"id"	INTEGER UNIQUE,
  "building_id" INTEGER,
  "unit_id" INTEGER,
	"first_name"	TEXT,
	"last_name"	TEXT,
	"street_address_1"	TEXT,
	"street_address_2"	TEXT,
	"city"	TEXT,
	"state"	TEXT,
	"postal_code"	TEXT,
	"country"	TEXT,
	"phone_home"	TEXT,
	"phone_work"	TEXT,
	"phone_emergency"	TEXT,
	"email"	TEXT,
	"notes"	TEXT,
	"profile_photos"	TEXT,
	"documents"	TEXT,
	"in_date"	INTEGER,
	"out_date"	INTEGER,
	PRIMARY KEY("id" AUTOINCREMENT)
);''');

const saveTenantDetails = ('''
INSERT INTO tenant_details (building_id, unit_id, first_name, last_name, street_address_1, street_address_2, city, state, postal_code, country, phone_home, phone_work, phone_emergency, email, notes, profile_photos, documents, in_date) VALUES
''');
