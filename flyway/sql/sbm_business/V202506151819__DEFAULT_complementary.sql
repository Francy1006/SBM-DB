-- MENU
INSERT INTO sbm_business.menu (menu, description)
VALUES ('BELLAVITA', 'Carta de pasta 1');
INSERT INTO sbm_business.menu (menu, description)
VALUES ('VEROGUSTO', 'Carta de pasta 2');
INSERT INTO sbm_business.menu (menu, description)
VALUES ('DESECHABLE', 'Carta general desechables');
INSERT INTO sbm_business.menu (menu, description)
VALUES ('DOLCEZZA', 'Carta de postres 1');
INSERT INTO sbm_business.menu (menu, description)
VALUES (
        'SERVICIOS INTERNOS',
        'Carta de servicios internos'
    );
INSERT INTO sbm_business.menu (menu, description)
VALUES (
        'SERVICIOS EXTERNOS',
        'Carta de servicios externos'
    );
-- ITEM-GROUP
INSERT INTO sbm_business.item_group (id, group_name, description, catalog_render) OVERRIDING SYSTEM VALUE
VALUES (
        1,
        'GRANEL',
        'ENVASE CON CONTENIDO A GRANEL',
        true
    );
INSERT INTO sbm_business.item_group (id, group_name, description, catalog_render) OVERRIDING SYSTEM VALUE
VALUES (2, 'UNIDAD', 'UNIDAD', false);
INSERT INTO sbm_business.item_group (id, group_name, description, catalog_render) OVERRIDING SYSTEM VALUE
VALUES (3, 'BANDEJA', 'BANDEJA', false);
INSERT INTO sbm_business.item_group (id, group_name, description, catalog_render) OVERRIDING SYSTEM VALUE
VALUES (
        4,
        'TIENDA',
        'PRESENTACION PARA VENTA DIRECTA COMENSAL',
        false
    );
INSERT INTO sbm_business.item_group (id, group_name, description, catalog_render) OVERRIDING SYSTEM VALUE
VALUES (
        5,
        'SERVICIO',
        'SERVICIO INTERNO O EXTERNO',
        false
    );
-- ITEM-CATEGORY
INSERT INTO sbm_business.item_category (id, category, description, catalog_render) OVERRIDING SYSTEM VALUE
VALUES (
        1,
        'PASTA',
        'PRODUCTO CRUDO PASTA LISA O RELLENA',
        true
    );
INSERT INTO sbm_business.item_category (id, category, description, catalog_render) OVERRIDING SYSTEM VALUE
VALUES (
        2,
        'SALSA',
        'PRODUCTO CRUDO SALSA PARA PASTA',
        true
    );
INSERT INTO sbm_business.item_category (id, category, description, catalog_render) OVERRIDING SYSTEM VALUE
VALUES (
        3,
        'BEBESTIBLE',
        'PRODUCTO BEBIDA O AGUA FRIA',
        false
    );
INSERT INTO sbm_business.item_category (id, category, description, catalog_render) OVERRIDING SYSTEM VALUE
VALUES (
        4,
        'DESECHABLE',
        'PRODUCTO DESECHABLE DE ENVASES O VASOS',
        false
    );
INSERT INTO sbm_business.item_category (id, category, description, catalog_render) OVERRIDING SYSTEM VALUE
VALUES (5, 'PASTELERIA', 'PRODUCTO PASTELERIA', false);
INSERT INTO sbm_business.item_category (id, category, description, catalog_render) OVERRIDING SYSTEM VALUE
VALUES (6, 'SANDWICH', 'PRODUCTO SANDWICH', false);
INSERT INTO sbm_business.item_category (id, category, description, catalog_render) OVERRIDING SYSTEM VALUE
VALUES (
        7,
        'CONDIMIENTO',
        'PRODUCTO DE CONDIMENTO PARA ALIMENTOS',
        false
    );
INSERT INTO sbm_business.item_category (id, category, description, catalog_render) OVERRIDING SYSTEM VALUE
VALUES (
        8,
        'FETUCCINE',
        'PLATO BASE PASTA FETUCCINE',
        false
    );
INSERT INTO sbm_business.item_category (id, category, description, catalog_render) OVERRIDING SYSTEM VALUE
VALUES (9, 'RAVIOLI', 'PLATO BASE PASTA RAVIOLI', false);
-- ITEM-TYPE
INSERT INTO sbm_business.item_type (id, "type", description) OVERRIDING SYSTEM VALUE
VALUES (
        1,
        'PRODUCTO CONGELADO',
        'PRODUCTO QUE REQUIERE CONGELAMIENTO (-18C)'
    );
INSERT INTO sbm_business.item_type (id, "type", description) OVERRIDING SYSTEM VALUE
VALUES (
        2,
        'PRODUCTO REFRIGERADO',
        'PRODUCTO QUE REQUIERE REFRIGERACION'
    );
INSERT INTO sbm_business.item_type (id, "type", description) OVERRIDING SYSTEM VALUE
VALUES (3, 'MATERIAL', 'PRODUCTO NO-ALIMENTICIO');
INSERT INTO sbm_business.item_type (id, "type", description) OVERRIDING SYSTEM VALUE
VALUES (
        4,
        'PRODUCTO ALMACEN',
        'PRODUCTO SIMPLE QUE NO REQUIERE REFRIGERACION'
    );
INSERT INTO sbm_business.item_type (id, "type", description) OVERRIDING SYSTEM VALUE
VALUES (5, 'SERVICIO', 'SERVICIO INTERNO O EXTERNO');
INSERT INTO sbm_business.item_type (id, "type", description) OVERRIDING SYSTEM VALUE
VALUES (
        6,
        'PRODUCTO COCIDO',
        'PRODUCTO COCIDO PARA COMENSAL'
    );
-- USER-TYPE
INSERT INTO sbm_business.user_type (id, type, description, created_at)
VALUES (1, 'ADMIN', 'SYSADMIN', '2025-06-16 16:19:23');
INSERT INTO sbm_business.user_type (id, type, description, created_at)
VALUES (
        2,
        'DISTRIBUCION',
        'CLIENTE DISTRIBUCION',
        '2025-06-16 16:19:23'
    );
INSERT INTO sbm_business.user_type (id, type, description, created_at)
VALUES (
        3,
        'FRANQUICIA',
        'CLIENTE FRANQUICIA',
        '2025-06-16 16:19:23'
    );
INSERT INTO sbm_business.user_type (id, type, description, created_at)
VALUES (
        4,
        'VISITA',
        'USUARIO VISITA',
        '2025-06-16 16:19:23'
    );
-- PACKAGE-TYPE
INSERT INTO sbm_business.package_type (id, type, description) OVERRIDING SYSTEM VALUE
VALUES (1, 'CAJA', 'ENVASE TIPO CAJA CARTON');
INSERT INTO sbm_business.package_type (id, type, description) OVERRIDING SYSTEM VALUE
VALUES (2, 'BANDEJA', 'BANDEJA PARA USO DESECHABLE');
INSERT INTO sbm_business.package_type (id, type, description) OVERRIDING SYSTEM VALUE
VALUES (3, 'CANASTO', 'CANASTO PLASTICO REUTILIZABLE');
INSERT INTO sbm_business.package_type (id, type, description) OVERRIDING SYSTEM VALUE
VALUES (4, 'BOLSA', 'BOLSA PLASTICA O PAPEL');
INSERT INTO sbm_business.package_type (id, type, description) OVERRIDING SYSTEM VALUE
VALUES (5, 'BOTELLA', 'BOTELLA PLASTICA O VIDRIO');
INSERT INTO sbm_business.package_type (id, type, description) OVERRIDING SYSTEM VALUE
VALUES (6, 'LATA', 'LATA METALICA');
INSERT INTO sbm_business.package_type (id, type, description) OVERRIDING SYSTEM VALUE
VALUES (7, 'TARRO', 'TARRO VIDRIO O PLASTICO');
INSERT INTO sbm_business.package_type (id, type, description) OVERRIDING SYSTEM VALUE
VALUES (8, 'SIN ENVASE', 'PRODUCTO SIN ENVASE');
-- TRANSPORT-TYPE
INSERT INTO sbm_business.transport_type (id, type, description) OVERRIDING SYSTEM VALUE
VALUES (1, 'REFRIGERADO', 'TRANSPORTE REFRIGERADO');
INSERT INTO sbm_business.transport_type (id, type, description) OVERRIDING SYSTEM VALUE
VALUES (2, 'CONGELADO', 'TRANSPORTE CONGELADO');
INSERT INTO sbm_business.transport_type (id, type, description) OVERRIDING SYSTEM VALUE
VALUES (3, 'SECO', 'TRANSPORTE SECO');
INSERT INTO sbm_business.transport_type (id, type, description) OVERRIDING SYSTEM VALUE
VALUES (4, 'FRAGIL', 'TRANSPORTE FRAGIL');
-- MEASURE-UNIT
INSERT INTO sbm_business.measure_unit (id, measure_unit, description) OVERRIDING SYSTEM VALUE
VALUES (1, 'KG', 'KILOGRAMOS');
INSERT INTO sbm_business.measure_unit (id, measure_unit, description) OVERRIDING SYSTEM VALUE
VALUES (2, 'G', 'GRAMOS');
INSERT INTO sbm_business.measure_unit (id, measure_unit, description) OVERRIDING SYSTEM VALUE
VALUES (3, 'L', 'LITROS');
INSERT INTO sbm_business.measure_unit (id, measure_unit, description) OVERRIDING SYSTEM VALUE
VALUES (4, 'ML', 'MILILITROS');
INSERT INTO sbm_business.measure_unit (id, measure_unit, description) OVERRIDING SYSTEM VALUE
VALUES (5, 'UN', 'UNIDADES');
INSERT INTO sbm_business.measure_unit (id, measure_unit, description) OVERRIDING SYSTEM VALUE
VALUES (6, 'PZ', 'PIEZAS');
INSERT INTO sbm_business.measure_unit (id, measure_unit, description) OVERRIDING SYSTEM VALUE
VALUES (7, 'M', 'METROS');
INSERT INTO sbm_business.measure_unit (id, measure_unit, description) OVERRIDING SYSTEM VALUE
VALUES (8, 'CM', 'CENTIMETROS');
-- PROVIDER-TYPE
INSERT INTO sbm_business.provider_type (type, description)
VALUES ('PRODUCTOR', 'PRODUCTOR DIRECTO');
INSERT INTO sbm_business.provider_type (type, description)
VALUES ('DISTRIBUIDOR', 'DISTRIBUIDOR');
INSERT INTO sbm_business.provider_type (type, description)
VALUES ('IMPORTADOR', 'IMPORTADOR');
INSERT INTO sbm_business.provider_type (type, description)
VALUES ('MAYORISTA', 'MAYORISTA');
INSERT INTO sbm_business.provider_type (type, description)
VALUES ('MINORISTA', 'MINORISTA');
-- BANK-ACCOUNT-TYPE
INSERT INTO sbm_business.bank_account_type (type, description)
VALUES ('CUENTA CORRIENTE', 'CUENTA CORRIENTE BANCARIA');
INSERT INTO sbm_business.bank_account_type (type, description)
VALUES ('CUENTA VISTA', 'CUENTA VISTA BANCARIA');
INSERT INTO sbm_business.bank_account_type (type, description)
VALUES ('CUENTA RUT', 'CUENTA RUT BANCARIA');
INSERT INTO sbm_business.bank_account_type (type, description)
VALUES ('CUENTA AHORRO', 'CUENTA DE AHORRO BANCARIA');
-- REGION
INSERT INTO sbm_business.region (id, region, description) OVERRIDING SYSTEM VALUE
VALUES (
        1,
        'ARICA Y PARINACOTA',
        'XV - REGION DE ARICA Y PARINACOTA'
    );
INSERT INTO sbm_business.region (id, region, description) OVERRIDING SYSTEM VALUE
VALUES (2, 'TARAPACA', 'I - REGION DE TARAPACA');
INSERT INTO sbm_business.region (id, region, description) OVERRIDING SYSTEM VALUE
VALUES (3, 'ANTOFAGASTA', 'II - REGION DE ANTOFAGASTA');
INSERT INTO sbm_business.region (id, region, description) OVERRIDING SYSTEM VALUE
VALUES (4, 'ATACAMA', 'III - REGION DE ATACAMA');
INSERT INTO sbm_business.region (id, region, description) OVERRIDING SYSTEM VALUE
VALUES (5, 'COQUIMBO', 'IV - REGION DE COQUIMBO');
INSERT INTO sbm_business.region (id, region, description) OVERRIDING SYSTEM VALUE
VALUES (6, 'VALPARAISO', 'V - REGION DE VALPARAISO');
INSERT INTO sbm_business.region (id, region, description) OVERRIDING SYSTEM VALUE
VALUES (
        7,
        'METROPOLITANA',
        'RM - REGION METROPOLITANA DE SANTIAGO'
    );
INSERT INTO sbm_business.region (id, region, description) OVERRIDING SYSTEM VALUE
VALUES (
        8,
        'OHIGGINS',
        'VI - REGION DEL LIBERTADOR BERNARDO OHIGGINS'
    );
INSERT INTO sbm_business.region (id, region, description) OVERRIDING SYSTEM VALUE
VALUES (9, 'MAULE', 'VII - REGION DEL MAULE');
INSERT INTO sbm_business.region (id, region, description) OVERRIDING SYSTEM VALUE
VALUES (10, 'ÑUBLE', 'XVI - REGION DE ÑUBLE');
INSERT INTO sbm_business.region (id, region, description) OVERRIDING SYSTEM VALUE
VALUES (11, 'BIOBIO', 'VIII - REGION DEL BIOBIO');
INSERT INTO sbm_business.region (id, region, description) OVERRIDING SYSTEM VALUE
VALUES (12, 'ARAUCANIA', 'IX - REGION DE LA ARAUCANIA');
INSERT INTO sbm_business.region (id, region, description) OVERRIDING SYSTEM VALUE
VALUES (13, 'LOS RIOS', 'XIV - REGION DE LOS RIOS');
INSERT INTO sbm_business.region (id, region, description) OVERRIDING SYSTEM VALUE
VALUES (14, 'LOS LAGOS', 'X - REGION DE LOS LAGOS');
INSERT INTO sbm_business.region (id, region, description) OVERRIDING SYSTEM VALUE
VALUES (15, 'AYSEN', 'XI - REGION DE AYSEN');
INSERT INTO sbm_business.region (id, region, description) OVERRIDING SYSTEM VALUE
VALUES (16, 'MAGALLANES', 'XII - REGION DE MAGALLANES');
-- Resetear la secuencia de region después de las inserciones manuales
SELECT setval(
        'sbm_business.region_id_seq',
        (
            SELECT MAX(id)
            FROM sbm_business.region
        ),
        true
    );
-- DISTRICT (SOME EXAMPLES)
INSERT INTO sbm_business.district (district, region, description)
VALUES ('SANTIAGO', 1, 'COMUNA DE SANTIAGO');
INSERT INTO sbm_business.district (district, region, description)
VALUES ('PROVIDENCIA', 1, 'COMUNA DE PROVIDENCIA');
INSERT INTO sbm_business.district (district, region, description)
VALUES ('LAS CONDES', 1, 'COMUNA DE LAS CONDES');
INSERT INTO sbm_business.district (district, region, description)
VALUES ('ÑUÑOA', 1, 'COMUNA DE ÑUÑOA');
INSERT INTO sbm_business.district (district, region, description)
VALUES ('MAIPU', 1, 'COMUNA DE MAIPU');
INSERT INTO sbm_business.district (district, region, description)
VALUES ('PUENTE ALTO', 1, 'COMUNA DE PUENTE ALTO');
INSERT INTO sbm_business.district (district, region, description)
VALUES ('LA FLORIDA', 1, 'COMUNA DE LA FLORIDA');
INSERT INTO sbm_business.district (district, region, description)
VALUES ('VALPARAISO', 2, 'COMUNA DE VALPARAISO');
INSERT INTO sbm_business.district (district, region, description)
VALUES ('VIÑA DEL MAR', 2, 'COMUNA DE VIÑA DEL MAR');
INSERT INTO sbm_business.district (district, region, description)
VALUES ('RANCAGUA', 3, 'COMUNA DE RANCAGUA');
INSERT INTO sbm_business.district (district, region, description)
VALUES ('TALCA', 4, 'COMUNA DE TALCA');
INSERT INTO sbm_business.district (district, region, description)
VALUES ('CONCEPCION', 5, 'COMUNA DE CONCEPCION');
INSERT INTO sbm_business.district (district, region, description)
VALUES ('TEMUCO', 6, 'COMUNA DE TEMUCO');
INSERT INTO sbm_business.district (district, region, description)
VALUES ('PUERTO MONTT', 7, 'COMUNA DE PUERTO MONTT');
INSERT INTO sbm_business.district (district, region, description)
VALUES ('COYHAIQUE', 8, 'COMUNA DE COYHAIQUE');
INSERT INTO sbm_business.district (district, region, description)
VALUES ('PUNTA ARENAS', 9, 'COMUNA DE PUNTA ARENAS');
INSERT INTO sbm_business.district (district, region, description)
VALUES ('IQUIQUE', 10, 'COMUNA DE IQUIQUE');
INSERT INTO sbm_business.district (district, region, description)
VALUES ('ANTOFAGASTA', 11, 'COMUNA DE ANTOFAGASTA');
INSERT INTO sbm_business.district (district, region, description)
VALUES ('COPIAPO', 12, 'COMUNA DE COPIAPO');
INSERT INTO sbm_business.district (district, region, description)
VALUES ('LA SERENA', 13, 'COMUNA DE LA SERENA');
INSERT INTO sbm_business.district (district, region, description)
VALUES ('ARICA', 14, 'COMUNA DE ARICA');
INSERT INTO sbm_business.district (district, region, description)
VALUES ('VALDIVIA', 15, 'COMUNA DE VALDIVIA');
INSERT INTO sbm_business.district (district, region, description)
VALUES ('CHILLAN', 16, 'COMUNA DE CHILLAN');
-- FISCAL-DIRECTIVE-TYPE
INSERT INTO sbm_business.fiscal_directive_type (type, description)
VALUES ('IVA', 'IMPUESTO AL VALOR AGREGADO');
INSERT INTO sbm_business.fiscal_directive_type (type, description)
VALUES ('RETENCION', 'RETENCION DE IMPUESTOS');
INSERT INTO sbm_business.fiscal_directive_type (type, description)
VALUES ('EXENTO', 'EXENTO DE IMPUESTOS');
INSERT INTO sbm_business.fiscal_directive_type (type, description)
VALUES ('OTRO', 'OTRO TIPO DE IMPUESTO');
INSERT INTO sbm_business.fiscal_directive_type (type, description)
VALUES (
        'NO_AFECTO',
        'OPERACIÓN NO AFECTA A IMPUESTOS (SIN IVA, ETC.)'
    );
INSERT INTO sbm_business.fiscal_directive_type (type, description)
VALUES ('ESPECIFICO', 'IMPUESTO ESPECÍFICO GENERAL');
INSERT INTO sbm_business.fiscal_directive_type (type, description)
VALUES (
        'ESPECIFICO_CATEGORIA',
        'IMPUESTO ESPECÍFICO SEGÚN CATEGORÍA DE PRODUCTO'
    );
INSERT INTO sbm_business.fiscal_directive_type (type, description)
VALUES (
        'ADICIONAL',
        'IMPUESTO ADICIONAL O COMPLEMENTARIO'
    );
INSERT INTO sbm_business.fiscal_directive_type (type, description)
VALUES ('ECOLOGICO', 'IMPUESTO VERDE O ECOLÓGICO');
INSERT INTO sbm_business.fiscal_directive_type (type, description)
VALUES ('ADUANERO', 'IMPUESTO DE ADUANA O INTERNACIONAL');
INSERT INTO sbm_business.fiscal_directive_type (type, description)
VALUES ('DIGITAL', 'IMPUESTO A SERVICIOS DIGITALES');
-- BANK
INSERT INTO sbm_business.bank (bank, description)
VALUES ('BANCO DE CHILE', 'BANCO DE CHILE');
INSERT INTO sbm_business.bank (bank, description)
VALUES ('BANCO ESTADO', 'BANCO DEL ESTADO DE CHILE');
INSERT INTO sbm_business.bank (bank, description)
VALUES ('BANCO SANTANDER', 'BANCO SANTANDER-CHILE');
INSERT INTO sbm_business.bank (bank, description)
VALUES ('BANCO BCI', 'BANCO DE CREDITO E INVERSIONES');
INSERT INTO sbm_business.bank (bank, description)
VALUES ('BANCO SCOTIABANK', 'BANCO SCOTIABANK CHILE');
INSERT INTO sbm_business.bank (bank, description)
VALUES ('BANCO ITAU', 'BANCO ITAU CHILE');
INSERT INTO sbm_business.bank (bank, description)
VALUES ('BANCO FALABELLA', 'BANCO FALABELLA');
INSERT INTO sbm_business.bank (bank, description)
VALUES ('BANCO RIPLEY', 'BANCO RIPLEY');
INSERT INTO sbm_business.bank (bank, description)
VALUES ('BANCO CONSORCIO', 'BANCO CONSORCIO');
INSERT INTO sbm_business.bank (bank, description)
VALUES ('BANCO SECURITY', 'BANCO SECURITY');
INSERT INTO sbm_business.bank (bank, description)
VALUES ('BANCO BICE', 'BANCO BICE');
INSERT INTO sbm_business.bank (bank, description)
VALUES ('BANCO INTERNACIONAL', 'BANCO INTERNACIONAL');
INSERT INTO sbm_business.bank (bank, description)
VALUES ('BANCO CORPBANCA', 'BANCO CORPBANCA');
INSERT INTO sbm_business.bank (bank, description)
VALUES ('BANCO PARIS', 'BANCO PARIS');
INSERT INTO sbm_business.bank (bank, description)
VALUES ('BANCO EDWARDS', 'BANCO EDWARDS');
INSERT INTO sbm_business.bank (bank, description)
VALUES ('BANCO BBVA', 'BANCO BBVA CHILE');
INSERT INTO sbm_business.bank (bank, description)
VALUES ('BANCO BICE', 'BANCO BICE');
INSERT INTO sbm_business.bank (bank, description)
VALUES ('BANCO INTERNACIONAL', 'BANCO INTERNACIONAL');
INSERT INTO sbm_business.bank (bank, description)
VALUES ('BANCO CORPBANCA', 'BANCO CORPBANCA');
INSERT INTO sbm_business.bank (bank, description)
VALUES ('BANCO PARIS', 'BANCO PARIS');
INSERT INTO sbm_business.bank (bank, description)
VALUES ('BANCO EDWARDS', 'BANCO EDWARDS');
INSERT INTO sbm_business.bank (bank, description)
VALUES ('BANCO BBVA', 'BANCO BBVA CHILE');
-- PACKAGE
INSERT INTO sbm_business.package (
        id,
        description,
        package_type,
        transport_type,
        "size",
        weight,
        measure_unit,
        quantity_unit,
        storage_instructions,
        transport_instructions,
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
VALUES(
        1,
        'CAJA FETUCCINE',
        1,
        1,
        3.00,
        3.00,
        4,
        20,
        'fb903bca-4ae0-11f0-8273-0242ac1a0002',
        'fb903bca-4ae0-11f0-8273-0242ac1a0002',
        NULL,
        true,
        '2025-06-17 20:51:36.000',
        NULL,
        '2025-06-17 20:51:36.000',
        NULL,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        NULL,
        NULL
    );
INSERT INTO sbm_business.package (
        id,
        description,
        package_type,
        transport_type,
        "size",
        weight,
        measure_unit,
        quantity_unit,
        storage_instructions,
        transport_instructions,
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
VALUES(
        2,
        'CAJA RAVIOLI',
        1,
        1,
        2.00,
        2.00,
        4,
        10,
        'fb903bca-4ae0-11f0-8273-0242ac1a0002',
        'fb903bca-4ae0-11f0-8273-0242ac1a0002',
        NULL,
        true,
        '2025-06-17 20:51:36.000',
        NULL,
        '2025-06-17 20:51:36.000',
        NULL,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        NULL,
        NULL
    );
INSERT INTO sbm_business.package (
        id,
        description,
        package_type,
        transport_type,
        "size",
        weight,
        measure_unit,
        quantity_unit,
        storage_instructions,
        transport_instructions,
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
VALUES(
        3,
        'KILO SALSA GRANEL',
        1,
        1,
        1.00,
        1.00,
        4,
        1,
        'fb903bca-4ae0-11f0-8273-0242ac1a0002',
        'fb903bca-4ae0-11f0-8273-0242ac1a0002',
        NULL,
        true,
        '2025-06-17 20:51:36.000',
        NULL,
        '2025-06-17 20:51:36.000',
        NULL,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        NULL,
        NULL
    );