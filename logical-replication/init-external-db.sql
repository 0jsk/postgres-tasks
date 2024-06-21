CREATE TABLE sales (
    id SERIAL PRIMARY KEY,
    sale_date DATE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    region VARCHAR(50) NOT NULL
);

CREATE SUBSCRIPTION sales_sub
CONNECTION 'host=db-main port=5432 user=postgres password=123 dbname=maindb'
PUBLICATION sales_pub;
