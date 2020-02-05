CREATE TABLE drivers (
    id serial PRIMARY KEY,
    first_name varchar,
    last_name varchar
);

CREATE TABLE vehicles (
    id serial PRIMARY KEY,
    make varchar,
    model varchar,
    driver_id integer REFERENCES drivers (id)
);

INSERT INTO drivers (first_name, last_name)
    VALUES ('Amy', 'Hua');

---------------------------------------------------------------------------------------------
-- Manipulating & Querying Data
-- Task 1

INSERT INTO drivers (first_name, last_name)
    VALUES ('Laura', 'Benz'), ('Erik', 'Sommer'), ('Yannik', 'Jung');

INSERT INTO vehicles (make, model, driver_id)
    VALUES ('Fiat', '500', 2), ('Opel', 'Corsa', 3), ('Tesla', 'Cybertruck', 4), ('Lada', 'Niva', 1);

---------------------------
-- Task 2

SELECT
    *
FROM
    drivers;

---------------------------
-- LIMIT 3;

SELECT
    *
FROM
    vehicles;

---------------------------
-- Task 3

UPDATE
    vehicles
SET
    driver_id = NULL
WHERE
    id = 1;

---------------------------
-- Task 4

UPDATE
    vehicles
SET
    driver_id = 1
WHERE
    id = 1;

---------------------------------------------------------------------------------------------
-- Joins & Group Bys
-- Task 1

SELECT
    vehicles.make || ' ' || vehicles.model AS vehicles
FROM
    vehicles
WHERE
    vehicles.driver_id = 3;

---------------------------
-- Task 2

SELECT
    vehicles.make || ' ' || vehicles.model AS vehicles
FROM
    vehicles
    INNER JOIN drivers ON drivers.id = vehicles.driver_id
WHERE
    drivers.first_name = 'Amy';

---------------------------
-- Task 3

SELECT
    vehicles.driver_id,
    COUNT('blob')
FROM
    vehicles
GROUP BY
    vehicles.driver_id;

---------------------------
-- Task 4

SELECT
    COUNT(DISTINCT vehicles.driver_id)
FROM
    vehicles
WHERE
    vehicles.make = 'Tesla';

---------------------------------------------------------------------------------------------
-- Structuring Data
-- Task 1

ALTER TABLE vehicles
    ADD COLUMN colour varchar;

---------------------------
-- Task 2

UPDATE
    vehicles
SET
    colour = 'mint green'
WHERE
    id = 2;

UPDATE
    vehicles
SET
    colour = 'dark grey'
WHERE
    id = 3;

UPDATE
    vehicles
SET
    colour = 'black'
WHERE
    id = 4;

UPDATE
    vehicles
SET
    colour = 'red'
WHERE
    id = 1;

UPDATE
    vehicles
SET
    colour = 'silver'
WHERE
    id = 5;

UPDATE
    vehicles
SET
    colour = 'black'
WHERE
    id = 6;

DELETE FROM vehicles
WHERE make IS NULL;

---------------------------
-- Task 3

ALTER TABLE drivers
    ADD COLUMN email varchar,
    ADD COLUMN
    address varchar;

---------------------------------------------------------------------------------------------
-- Challenges
-- Task 1

ALTER TABLE vehicles
    ADD COLUMN reg_date date;

UPDATE
    vehicles
SET
    reg_date = '2018-12-15'
WHERE
    id = 1;

UPDATE
    vehicles
SET
    reg_date = '2019-01-15'
WHERE
    id = 2;

UPDATE
    vehicles
SET
    reg_date = '2019-02-15'
WHERE
    id = 3;

UPDATE
    vehicles
SET
    reg_date = '2019-04-15'
WHERE
    id = 4;

UPDATE
    vehicles
SET
    reg_date = '2019-05-15'
WHERE
    id = 5;

UPDATE
    vehicles
SET
    reg_date = '2019-12-15'
WHERE
    id = 6;

---------------------------
-- Task 2

SELECT
    vehicles.driver_id,
    vehicles.reg_date,
    vehicles.make || ' ' || vehicles.model AS vehicles,
    drivers.first_name || ' ' || drivers.last_name AS driver_name
FROM
    vehicles
    LEFT JOIN drivers ON vehicles.driver_id = drivers.id
WHERE
    NOW() - interval '11 months' > reg_date;

CREATE DATABASE template1 TEMPLATE template0;

