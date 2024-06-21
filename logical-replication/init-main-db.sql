ALTER SYSTEM SET wal_level = logical;

CREATE TABLE sales (
    id SERIAL PRIMARY KEY,
    sale_date DATE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    region VARCHAR(50) NOT NULL
);

INSERT INTO sales (sale_date, amount, region) VALUES
('2024-05-01', 100.50, 'North'),
('2024-05-02', 200.75, 'South'),
('2024-05-03', 150.25, 'East');

CREATE PUBLICATION sales_pub FOR TABLE sales;
