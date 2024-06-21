CREATE FOREIGN TABLE foreign_sales (
    id INTEGER,
    sale_date DATE,
    amount DECIMAL(10, 2),
    region VARCHAR(50)
)
SERVER external_server
OPTIONS (schema_name 'public', table_name 'external_sales');
