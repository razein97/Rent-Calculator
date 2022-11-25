const String createTableBuildingsSQL = '''CREATE TABLE "buildings" (
	"id"	INTEGER NOT NULL UNIQUE,
	"name"	TEXT,
	"address"	TEXT,
	"units"	INTEGER,
	PRIMARY KEY("id" AUTOINCREMENT)
);''';

const String createTableUnitsSQL = '''CREATE TABLE units(
                    id INTEGER NOT NULL UNIQUE,
                    building_id INT,
                    unit_name TEXT,
                    rent REAL,
                    security_deposit REAL,
                    electricity_unit REAL,
                    amenities TEXT,
                    rented_status BOOL,
                    PRIMARY KEY("id" AUTOINCREMENT)
                    );''';

const String createTableTenantDetailsSQL = '''
CREATE TABLE "tenant_details" (
	"id"	INTEGER NOT NULL UNIQUE,
  "building_id" INTEGER,
  "unit_id" INTEGER,
  "rent" REAL,
  "security_deposit" REAL,
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
  "amenities" TEXT,
	"in_date"	INTEGER,
	"out_date"	INTEGER,
  "is_checked_out" BOOL,
	PRIMARY KEY("id" AUTOINCREMENT)
);''';

const String createTransactionsSQL = '''
CREATE TABLE "transactions" (
	"id"	INTEGER NOT NULL UNIQUE,
	"building_id"	INTEGER,
	"unit_id"	INTEGER,
	"date"	INTEGER,
	"current_electricity_unit"	REAL,
	"previous_electricity_unit"	REAL,
	"tenants"	TEXT,
	"electricity_cost"	REAL,
	"rent_amount"	REAL,
	"total_cost"	REAL,
	PRIMARY KEY("id" AUTOINCREMENT)
);''';

const String createRentAmountSQL = '''
CREATE TABLE "units_rents" (
	"id"	INTEGER NOT NULL UNIQUE,
	"building_id"	INTEGER,
	"unit_id"	INTEGER,
	"rent_amount"	REAL,
	"date"	INTEGER,
	PRIMARY KEY("id" AUTOINCREMENT)
);''';

const String saveTenantDetailsSQL = '''
INSERT INTO tenant_details 
(building_id,
unit_id,
rent,
security_deposit,
first_name,
last_name,
street_address_1,
street_address_2,
city,
state, 
postal_code,
country,
phone_home,
phone_work,
phone_emergency,
email,
notes,
profile_photos,
documents,
amenities,
in_date,
is_checked_out) 
VALUES 
(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);
''';

const String updateTenantDetailsSQL = '''
UPDATE tenant_details SET first_name = ?, last_name = ?, street_address_1 = ?, 
street_address_2 = ?, 
city = ?, 
state = ?, 
postal_code = ?, 
country = ?, 
phone_home = ?, 
phone_work = ?, 
phone_emergency = ?, 
email = ?, 
notes = ?, 
profile_photos = ?, 
documents = ? WHERE id = ? AND building_id = ? AND unit_id = ?;
''';
