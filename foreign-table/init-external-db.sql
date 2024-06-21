CREATE TABLE sales (
    id SERIAL,
    sale_date DATE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    region VARCHAR(50) NOT NULL
);

INSERT INTO sales (sale_date, amount, region) VALUES
('2024-01-01', 100.00, 'North'),
('2024-01-02', 200.00, 'South'),
('2024-01-03', 150.00, 'East'),
('2024-01-04', 300.00, 'West'),
('2024-01-05', 250.00, 'North');
