DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS films;
DROP TABLE IF EXISTS customers;

CREATE TABLE films(
  id SERIAL PRIMARY KEY,
  title VARCHAR,
  price INT
);

CREATE TABLE customers(
  id SERIAL PRIMARY KEY,
  name VARCHAR,
  funds INT
);

CREATE TABLE tickets(
  id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES customers(id),
  film_id INT REFERENCES films(id)
);
