CREATE TABLE sales (
	id SERIAL,
	sale_date DATE NOT NULL,
	amount DECIMAL(10, 2) NOT NULL,
	region VARCHAR(50) NOT NULL
) PARTITION BY LIST (region);

CREATE TABLE sales_north PARTITION OF sales FOR VALUES IN ('North');

CREATE TABLE sales_south PARTITION OF sales FOR VALUES IN ('South');

CREATE TABLE sales_east PARTITION OF sales FOR VALUES IN ('East');

CREATE TABLE sales_west PARTITION OF sales FOR VALUES IN ('West');

CREATE INDEX ON sales_north (sale_date);
CREATE INDEX ON sales_south (sale_date);
CREATE INDEX ON sales_east (sale_date);
CREATE INDEX ON sales_west (sale_date);

INSERT INTO sales (sale_date, amount, region) VALUES
('2024-01-01', 100.00, 'North'),
('2024-01-02', 150.00, 'South'),
('2024-01-03', 200.00, 'East'),
('2024-01-04', 250.00, 'West'),
('2024-01-05', 300.00, 'North');

EXPLAIN (ANALYZE, VERBOSE) SELECT * FROM sales WHERE region = 'North';
-- SELECT tableoid::regclass, * FROM sales;

-- ALTER TABLE sales DETACH PARTITION sales_west;
