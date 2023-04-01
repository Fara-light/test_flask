DROP TABLE IF EXISTS manufacturer;
CREATE TABLE manufacturer (
        manufacturer_id INTEGER PRIMARY KEY AUTOINCREMENT,
        manufacturer_name STRING NOT NULL
);

DROP TABLE IF EXISTS car;
CREATE TABLE car (
        car_id INTEGER PRIMARY KEY AUTOINCREMENT,
        car_name STRING NOT NULL,
        manufacturer_id INTEGER NOT NULL,
        FOREIGN KEY (manufacturer_id) REFERENCES manufacturer (manufacturer_id)
);

DROP TABLE IF EXISTS company;
CREATE TABLE company (
        company_id INTEGER PRIMARY KEY AUTOINCREMENT,
        company_name STRING NOT NULL
);

DROP TABLE IF EXISTS category;
CREATE TABLE category (
        category_id INTEGER PRIMARY KEY AUTOINCREMENT,
        category_name STRING NOT NULL,
        category_price INTEGER NOT NULL,
        company_id INTEGER NOT NULL,
        FOREIGN KEY (company_id) REFERENCES company (company_id)
);

DROP TABLE IF EXISTS category_car;
CREATE TABLE category_car (
        category_car_id INTEGER PRIMARY KEY AUTOINCREMENT,
        category_id INTEGER NOT NULL,
        car_id INTEGER NOT NULL,
        FOREIGN KEY (category_id) REFERENCES category (category_id),
        FOREIGN KEY (car_id) REFERENCES car (car_id)
);

