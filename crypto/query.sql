SELECT 
    id, 
    username, 
    password_hash AS encrypted_password,
    pgp_sym_decrypt(password_hash, 'vasilkov-kv') AS decrypted_password
FROM users;
