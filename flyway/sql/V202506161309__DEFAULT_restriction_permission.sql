-- PERMISSION-TYPE
INSERT INTO
    ditaly_pasta.permission_type (
        id,
        `type`,
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
        '1',
        'CATALOGE',
        'CATALOGE PRODUCT',
        NULL,
        1,
        '2025-06-16 17:14:02',
        NULL,
        '2025-06-16 18:03:43',
        NULL,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        NULL,
        NULL
    );

INSERT INTO
    ditaly_pasta.permission_type (
        id,
        `type`,
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
        '2',
        'PRICE',
        'PRICE LABEL',
        NULL,
        1,
        '2025-06-16 18:03:43',
        NULL,
        '2025-06-16 18:03:43',
        NULL,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        NULL,
        NULL
    );

-- PERMISSION
INSERT INTO
    ditaly_pasta.permission (
        id,
        permission,
        description,
        `type`,
        is_deleted,
        is_confirmed,
        created_at,
        updated_at,
        confirmed_at,
        deleted_at,
        created_by,
        updated_by,
        confirmed_by,
        deleted_by,
        LOG
    )
VALUES
    (
        'b375e975-4ad5-11f0-8378-0242ac180002',
        'VIEW_CATALOGE',
        'PRODUCT CATALOGE VIEW',
        1,
        NULL,
        1,
        '2025-06-16 17:16:54',
        NULL,
        '2025-06-16 17:16:54',
        NULL,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        NULL,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        NULL,
        "init;"
    );

INSERT INTO
    ditaly_pasta.permission (
        id,
        permission,
        description,
        `type`,
        is_deleted,
        is_confirmed,
        created_at,
        updated_at,
        confirmed_at,
        deleted_at,
        created_by,
        updated_by,
        confirmed_by,
        deleted_by,
        LOG
    )
VALUES
    (
        '5303528f-4adc-11f0-8378-0242ac180002',
        'PREMIUM_PRICE',
        'PREMIUM VIEW',
        2,
        NULL,
        1,
        '2025-06-16 17:16:54',
        NULL,
        '2025-06-16 17:16:54',
        NULL,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        NULL,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        NULL,
        "init;"
    );

-- ROLE-PERMISSION
INSERT INTO
    ditaly_pasta.role_permissions (
        id,
        `role`,
        permission,
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
        '8cb306e4-4adb-11f0-8378-0242ac180002',
        'e134d17c-4ad0-11f0-8ce6-0242ac120002',
        'b375e975-4ad5-11f0-8378-0242ac180002',
        NULL,
        1,
        '2025-06-16 17:58:46',
        NULL,
        '2025-06-16 17:58:46',
        NULL,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        NULL,
        NULL
    );

INSERT INTO
    ditaly_pasta.role_permissions (
        id,
        `role`,
        permission,
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
        '8d695a81-4adc-11f0-8378-0242ac180002',
        'e134d17c-4ad0-11f0-8ce6-0242ac120002',
        '5303528f-4adc-11f0-8378-0242ac180002',
        NULL,
        1,
        '2025-06-16 17:58:46',
        NULL,
        '2025-06-16 17:58:46',
        NULL,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        NULL,
        NULL
    );

-- RESTRICTION
INSERT INTO
    ditaly_pasta.restriction (
        id,
        restriction,
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
        deleted_by,
        LOG,
        version
    )
VALUES
    (
        '57775b30-4ad4-11f0-8378-0242ac180002',
        'RESTRICTION-01',
        'RESTRICTION GENERAL',
        NULL,
        1,
        '2025-06-16 17:14:02',
        NULL,
        '2025-06-16 17:14:02',
        NULL,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        NULL,
        NULL,
        'init;',
        1
    );

-- RESTRICTION-ROLES
INSERT INTO
    ditaly_pasta.restriction_roles (
        id,
        restriction,
        `role`,
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
        '57775b30-4ad4-11f0-8378-0242ac180002',
        'e134d17c-4ad0-11f0-8ce6-0242ac120002',
        NULL,
        1,
        '2025-06-16 17:58:46',
        NULL,
        '2025-06-16 17:58:46',
        NULL,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        NULL,
        NULL
    );