INSERT INTO
    sbmbusiness.`user` (
        id,
        code,
        `type`,
        google_id,
        email,
        name,
        last_name,
        is_active,
        is_deleted,
        is_confirmed,
        created_at,
        updated_at,
        confirmed_at,
        deleted_at,
        deleted_by
    )
VALUES
    (
        1,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        1,
        '123123123',
        'fra.sotomen@gmail.com',
        'FRANCISCO',
        'MENDOZA',
        1,
        NULL,
        1,
        '2025-06-16 16:38:46',
        NULL,
        '2025-06-16 16:38:46',
        NULL,
        NULL
    );

INSERT INTO
    sbmbusiness.`role` (
        id,
        `role`,
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
        'e134d17c-4ad0-11f0-8ce6-0242ac120002',
        'ADMIN ROLE',
        'ADMIN ROLE',
        NULL,
        1,
        '2025-06-16 16:42:24',
        NULL,
        NULL,
        NULL,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        NULL,
        NULL
    );