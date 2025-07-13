-- INSERT DITALY PASTA USER
-- Insertar usuario de gestión para Ditaly Pasta

INSERT INTO sbm_business."user" (
    id, 
    code, 
    "type", 
    google_id, 
    mail, 
    phone, 
    "name", 
    last_name, 
    is_active, 
    is_deleted, 
    is_confirmed, 
    created_at, 
    updated_at, 
    confirmed_at, 
    deleted_at, 
    deleted_by, 
    log, 
    "version"
)
VALUES (
    2, 
    '1b4ec1e3-2b23-461f-83f7-3901f77c5ddc', 
    1, 
    '100676468701354762055', 
    'ditalypasta.manage@gmail.com', 
    0, 
    'manage', 
    'ditaly pasta', 
    true, 
    false, 
    true, 
    '2025-07-13 10:44:08.738', 
    NULL, 
    NULL, 
    NULL, 
    NULL, 
    'init;', 
    1
) ON CONFLICT (id) DO NOTHING;

-- Comentario para documentar el cambio
COMMENT ON TABLE sbm_business."user" IS 'Usuario agregado: ditalypasta.manage@gmail.com - Usuario de gestión para Ditaly Pasta'; 