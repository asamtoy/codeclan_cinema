DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS films;
DROP TABLE IF EXISTS customers;

CREATE TABLE films (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  price INT
);

CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  funds INT
);

CREATE TABLE tickets (
  id SERIAL PRIMARY KEY,
  film_id INT REFERENCES films(id),
  customer_id INT REFERENCES customers(id)
);
