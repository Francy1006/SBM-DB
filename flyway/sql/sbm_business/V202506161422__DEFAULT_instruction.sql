-- INSTRUCTION-TYPE
INSERT INTO
    sbm_business.instruction_type (
        id,
        type,
        description,
        is_deleted,
        is_confirmed,
        created_at,
        updated_at,
        confirmed_at,
        deleted_at,
        created_by,
        confirmed_by,
        updated_by,
        deleted_by
    )
VALUES
    (
        1,
        'PRODUCT',
        'PRODUCT INSTRUCTION',
        false,
        true,
        '2025-06-16 18:21:57',
        NULL,
        '2025-06-16 18:21:57',
        NULL,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        NULL,
        NULL
    );
INSERT INTO
    sbm_business.instruction_type (
        id,
        type,
        description,
        is_deleted,
        is_confirmed,
        created_at,
        updated_at,
        confirmed_at,
        deleted_at,
        created_by,
        confirmed_by,
        updated_by,
        deleted_by
    )
VALUES
    (
        2,
        'SERVICE',
        'SERVICE INSTRUCTION',
        false,
        true,
        '2025-06-16 18:21:57',
        NULL,
        '2025-06-16 18:21:57',
        NULL,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        NULL,
        NULL
    );
-- INSTRUCTION
INSERT INTO
    sbm_business.instruction (
        code,
        instruction,
        description,
        url_documentation,
        type,
        is_deleted,
        is_confirmed,
        created_at,
        updated_at,
        confirmed_at,
        deleted_at,
        created_by,
        confirmed_by,
        updated_by,
        deleted_by
    )
VALUES
(
        'fb903bca-4ae0-11f0-8273-0242ac1a0002',
        'USO-PASTA CONGELADA',
        '<ol>
  <li>Abrir envase congelado</li>
  <li>Insertar contenido en agua hirviendo</li>
  <li>Cocinar por 3 minutos</li>
  <li>Colar y servir</li>
</ol>
',
        'www.google.cl',
        1,
        false,
        true,
        '2025-06-16 18:37:40',
        NULL,
        '2025-06-16 18:37:40',
        NULL,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        NULL,
        NULL
    );
