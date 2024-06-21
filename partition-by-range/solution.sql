CREATE TABLE sales (
    id SERIAL,
    sale_date DATE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    region VARCHAR(50) NOT NULL
) PARTITION BY RANGE (sale_date);

CREATE TABLE sales_2024_q1 PARTITION OF sales
    FOR VALUES FROM ('2024-01-01') TO ('2024-04-01');

CREATE TABLE sales_2024_q2 PARTITION OF sales
    FOR VALUES FROM ('2024-04-01') TO ('2024-07-01');

CREATE TABLE sales_2024_q3 PARTITION OF sales
    FOR VALUES FROM ('2024-07-01') TO ('2024-10-01');

CREATE TABLE sales_2024_q4 PARTITION OF sales
    FOR VALUES FROM ('2024-10-01') TO ('2025-01-01');

CREATE INDEX ON sales (sale_date);

INSERT INTO sales (sale_date, amount, region) VALUES
    ('2024-02-15', 1000.00, 'North'),
    ('2024-05-20', 1500.50, 'South'),
    ('2024-08-10', 2000.75, 'East'),
    ('2024-11-30', 2500.25, 'West');

EXPLAIN (ANALYZE, VERBOSE) SELECT * FROM sales WHERE sale_date >= '2024-01-01' AND sale_date < '2025-01-01';
