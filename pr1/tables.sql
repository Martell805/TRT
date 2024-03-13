DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

CREATE TABLE location
(
    location_id SERIAL PRIMARY KEY,
    name        VARCHAR(14)
);

CREATE TABLE department
(
    department_id SERIAL PRIMARY KEY,
    name          VARCHAR(14),
    location_id   INTEGER,
    FOREIGN KEY (location_id) REFERENCES location (location_id)
);

CREATE TABLE job
(
    job_id   SERIAL PRIMARY KEY,
    function VARCHAR(30)
);

CREATE TABLE employee
(
    employee_id    SERIAL PRIMARY KEY,
    last_name      VARCHAR(15),
    first_name     VARCHAR(15),
    middle_initial VARCHAR(1),
    manager_id     INTEGER,
    job_id         INTEGER,
    hire_date      DATE,
    salary         NUMERIC(7, 2),
    commission     NUMERIC(7, 2),
    department_id  INTEGER,
    CONSTRAINT ref_emp_manger FOREIGN KEY (manager_id) REFERENCES employee (employee_id),
    FOREIGN KEY (job_id) REFERENCES job (job_id),
    FOREIGN KEY (department_id) REFERENCES department (department_id)
);

CREATE TABLE customer
(
    customer_id    SERIAL PRIMARY KEY,
    name           VARCHAR(45),
    address        VARCHAR(40),
    city           VARCHAR(30),
    state          VARCHAR(2),
    zip_code       VARCHAR(9),
    area_code      SMALLINT,
    phone_number   SMALLINT,
    salesperson_id INTEGER,
    credit_limit   NUMERIC(9, 2),
    comments       TEXT,
    FOREIGN KEY (salesperson_id) REFERENCES employee (employee_id)
);


CREATE TABLE sales_order(
    order_id    SERIAL PRIMARY KEY,
    order_date  DATE,
    customer_id INTEGER,
    ship_date   DATE,
    total       NUMERIC(8, 2),
    FOREIGN KEY (customer_id) REFERENCES customer (customer_id)
);

CREATE TABLE product(
    product_id  SERIAL PRIMARY KEY,
    description VARCHAR(30)
);

CREATE TABLE price(
    product_id SERIAL,
    list_price NUMERIC(8, 2),
    min_price  NUMERIC(8, 2),
    start_date DATE,
    end_date   DATE,
    PRIMARY KEY (product_id, start_date),
    FOREIGN KEY (product_id) REFERENCES product (product_id)
);

CREATE TABLE item(
    order_id     INTEGER,
    item_id      SERIAL,
    product_id   INTEGER,
    actual_price NUMERIC(8, 2),
    quantity     INTEGER,
    total        NUMERIC(8, 2),
    PRIMARY KEY (item_id, order_id),
    FOREIGN KEY (order_id) REFERENCES sales_order (order_id),
    FOREIGN KEY (product_id) REFERENCES product (product_id)
);