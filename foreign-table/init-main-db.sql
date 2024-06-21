CREATE EXTENSION postgres_fdw;

CREATE SERVER external_server
    FOREIGN DATA WRAPPER postgres_fdw
    OPTIONS (host 'db-external', port '5432', dbname 'externaldb');

CREATE USER MAPPING FOR CURRENT_USER
    SERVER external_server
    OPTIONS (user 'postgres', password '123');

CREATE FOREIGN TABLE external_sales (
    id SERIAL,
    sale_date DATE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    region VARCHAR(50) NOT NULL
)
SERVER external_server
OPTIONS (schema_name 'public', table_name 'sales');
