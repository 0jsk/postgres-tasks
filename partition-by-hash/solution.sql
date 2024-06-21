CREATE TABLE sales (
	id SERIAL,
	sale_date DATE NOT NULL,
	amount DECIMAL(10, 2) NOT NULL,
	region VARCHAR(50) NOT NULL
) PARTITION BY HASH (id);

CREATE TABLE sales_0 PARTITION OF sales
    FOR VALUES WITH (MODULUS 4, REMAINDER 0);

CREATE TABLE sales_1 PARTITION OF sales
    FOR VALUES WITH (MODULUS 4, REMAINDER 1);

CREATE TABLE sales_2 PARTITION OF sales
    FOR VALUES WITH (MODULUS 4, REMAINDER 2);

CREATE TABLE sales_3 PARTITION OF sales
    FOR VALUES WITH (MODULUS 4, REMAINDER 3);

-- Создать индексы для секций

INSERT INTO sales (sale_date, amount, region)
SELECT 
    current_date - (random() * 365)::integer,
    (random() * 1000)::numeric(10,2),
    (ARRAY['North', 'South', 'East', 'West'])[floor(random() * 4 + 1)]
FROM generate_series(1, 1000);

SELECT tableoid::regclass, count(*) FROM SALES
GROUP BY tableoid
ORDER BY tableoid;

EXPLAIN (ANALYZE, VERBOSE) SELECT * FROM sales WHERE id = 500;
