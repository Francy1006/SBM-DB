-- PERMISSION-TYPE
INSERT INTO
    sbm_business.permission_type (
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
        'CATALOG',
        'CATALOG PRODUCT',
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
    sbm_business.permission_type (
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
    sbm_business.permission (
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
        'VIEW_CATALOG',
        'PRODUCT CATALOG VIEW',
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
    sbm_business.permission (
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
    sbm_business.role_permissions (
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
    sbm_business.role_permissions (
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
    sbm_business.restriction (
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
        LOG
    )
VALUES
    (
        'f8b5e975-4ad5-11f0-8378-0242ac180002',
        'PUBLIC',
        'PUBLIC ACCESS',
        NULL,
        1,
        '2025-06-16 17:16:54',
        NULL,
        '2025-06-16 17:16:54',
        NULL,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        NULL,
        NULL,
        "init;"
    );

INSERT INTO
    sbm_business.restriction (
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
        LOG
    )
VALUES
    (
        'f9b5e975-4ad5-11f0-8378-0242ac180002',
        'PRIVATE',
        'PRIVATE ACCESS',
        NULL,
        1,
        '2025-06-16 17:16:54',
        NULL,
        '2025-06-16 17:16:54',
        NULL,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        NULL,
        NULL,
        "init;"
    );

INSERT INTO
    sbm_business.restriction (
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
        LOG
    )
VALUES
    (
        'fab5e975-4ad5-11f0-8378-0242ac180002',
        'ADMIN',
        'ADMIN ACCESS',
        NULL,
        1,
        '2025-06-16 17:16:54',
        NULL,
        '2025-06-16 17:16:54',
        NULL,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        NULL,
        NULL,
        "init;"
    );

-- RESTRICTION-ROLES
INSERT INTO
    sbm_business.restriction_roles (
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
        'f8b5e975-4ad5-11f0-8378-0242ac180002',
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

INSERT INTO
    sbm_business.restriction_roles (
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
        'f9b5e975-4ad5-11f0-8378-0242ac180002',
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

INSERT INTO
    sbm_business.restriction_roles (
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
        'fab5e975-4ad5-11f0-8378-0242ac180002',
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