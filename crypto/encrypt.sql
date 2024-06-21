CREATE OR REPLACE FUNCTION encrypt_password(password TEXT)
RETURNS BYTEA AS $$
BEGIN
    RETURN pgp_sym_encrypt(password, 'vasilkov-kv');
END;
$$ LANGUAGE plpgsql;

INSERT INTO users (username, password_hash)
VALUES 
('ivan ivanov', encrypt_password('password123')),
('kirill vasilkov', encrypt_password('123')),
('boris ivanov', encrypt_password('12345'));
