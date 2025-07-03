-- MENU
INSERT INTO
    sbm_business.menu (menu, description)
VALUES
    ('BELLAVITA', 'Carta de pasta 1');

INSERT INTO
    sbm_business.menu (menu, description)
VALUES
    ('VEROGUSTO', 'Carta de pasta 2');

INSERT INTO
    sbm_business.menu (menu, description)
VALUES
    ('DESECHABLE', 'Carta general desechables');

INSERT INTO
    sbm_business.menu (menu, description)
VALUES
    ('DOLCEZZA', 'Carta de postres 1');

INSERT INTO
    sbm_business.menu (menu, description)
VALUES
    (
        'SERVICIOS INTERNOS',
        'Carta de servicios internos'
    );

INSERT INTO
    sbm_business.menu (menu, description)
VALUES
    (
        'SERVICIOS EXTERNOS',
        'Carta de servicios externos'
    );

-- ITEM-GROUP
INSERT INTO
    sbm_business.item_group (group_name, description, catalog_render)
VALUES
('GRANEL', 'ENVASE CON CONTENIDO A GRANEL', 1);

INSERT INTO
    sbm_business.item_group (group_name, description, catalog_render)
VALUES
('UNIDAD', 'UNIDAD', 0);

INSERT INTO
    sbm_business.item_group (group_name, description, catalog_render)
VALUES
('BANDEJA', 'BANDEJA', 0);

INSERT INTO
    sbm_business.item_group (group_name, description, catalog_render)
VALUES
(
        'TIENDA',
        'PRESENTACION PARA VENTA DIRECTA COMENSAL',
        0
    );

INSERT INTO
    sbm_business.item_group (group_name, description, catalog_render)
VALUES
('SERVICIO', 'SERVICIO INTERNO O EXTERNO', 0);

-- ITEM-CATEGORY
INSERT INTO
    sbm_business.item_category (category, description, catalog_render)
VALUES
    ('PASTA', 'PRODUCTO PASTA LISA O RELLENA', 1);

INSERT INTO
    sbm_business.item_category (category, description, catalog_render)
VALUES
    ('SALSA', 'PRODUCTO SALSA PARA PASTA', 1);

INSERT INTO
    sbm_business.item_category (category, description, catalog_render)
VALUES
    ('BEBESTIBLE', 'PRODUCTO BEBIDA O AGUA FRIA', 0);

INSERT INTO
    sbm_business.item_category (category, description, catalog_render)
VALUES
    (
        'DESECHABLE',
        'PRODUCTO DESECHABLE DE ENVASES O VASOS',
        0
    );

INSERT INTO
    sbm_business.item_category (category, description, catalog_render)
VALUES
    ('PASTELERIA', 'PRODUCTO PASTELERIA', 0);

INSERT INTO
    sbm_business.item_category (category, description, catalog_render)
VALUES
    ('SANDWICH', 'PRODUCTO SANDWICH', 0);

INSERT INTO
    sbm_business.item_category (category, description, catalog_render)
VALUES
    (
        'CONDIMIENTO',
        'PRODUCTO DE CONDIMENTO PARA ALIMENTOS',
        0
    );

-- ITEM-TYPE
INSERT INTO
    sbm_business.item_type (id, `type`, description)
VALUES
    (
        1,
        'PRODUCTO CONGELADO',
        'PRODUCTO QUE REQUIERE CONGELAMIENTO (-18C)'
    );

INSERT INTO
    sbm_business.item_type (id, `type`, description)
VALUES
    (
        2,
        'PRODUCTO REFRIGERADO',
        'PRODUCTO QUE REQUIERE REFRIGERACION'
    );

INSERT INTO
    sbm_business.item_type (id, `type`, description)
VALUES
    (3, 'MATERIAL', 'PRODUCTO NO-ALIMENTICIO');

INSERT INTO
    sbm_business.item_type (id, `type`, description)
VALUES
    (
        4,
        'PRODUCTO ALMACEN',
        'PRODUCTO SIMPLE QUE NO REQUIERE REFRIGERACION'
    );

INSERT INTO
    sbm_business.item_type (id, `type`, description)
VALUES
    (5, 'SERVICIO', 'SERVICIO INTERNO O EXTERNO');

-- USER-TYPE
INSERT INTO
    sbm_business.user_type (id, `type`, description, created_at)
VALUES
    (1, 'ADMIN', 'SYSADMIN', '2025-06-16 16:19:23');

INSERT INTO
    sbm_business.user_type (id, `type`, description, created_at)
VALUES
    (
        2,
        'DISTRIBUCION',
        'CLIENTE DISTRIBUCION',
        '2025-06-16 16:19:23'
    );

INSERT INTO
    sbm_business.user_type (id, `type`, description, created_at)
VALUES
    (
        3,
        'FRANQUICIA',
        'CLIENTE FRANQUICIA',
        '2025-06-16 16:19:23'
    );

INSERT INTO
    sbm_business.user_type (id, `type`, description, created_at)
VALUES
    (
        4,
        'VISITA',
        'USUARIO VISITA',
        '2025-06-16 16:19:23'
    );

-- PACKAGE-TYPE
INSERT INTO
    sbm_business.package_type (`type`, description)
VALUES
    ('CAJA', 'ENVASE TIPO CAJA CARTON');

INSERT INTO
    sbm_business.package_type (`type`, description)
VALUES
    ('BANDEJA', 'BANDEJA PARA USO DESECHABLE');

INSERT INTO
    sbm_business.package_type (`type`, description)
VALUES
    ('CANASTO', 'CANASTO PLASTICO REUTILIZABLE');

INSERT INTO
    sbm_business.package_type (`type`, description)
VALUES
    ('BOLSA', 'BOLSA PLASTICA O PAPEL');

INSERT INTO
    sbm_business.package_type (`type`, description)
VALUES
    ('BOTELLA', 'BOTELLA PLASTICA O VIDRIO');

INSERT INTO
    sbm_business.package_type (`type`, description)
VALUES
    ('LATA', 'LATA METALICA');

INSERT INTO
    sbm_business.package_type (`type`, description)
VALUES
    ('TARRO', 'TARRO VIDRIO O PLASTICO');

INSERT INTO
    sbm_business.package_type (`type`, description)
VALUES
    ('SIN ENVASE', 'PRODUCTO SIN ENVASE');

-- TRANSPORT-TYPE
INSERT INTO
    sbm_business.transport_type (`type`, description)
VALUES
    ('REFRIGERADO', 'TRANSPORTE REFRIGERADO');

INSERT INTO
    sbm_business.transport_type (`type`, description)
VALUES
    ('CONGELADO', 'TRANSPORTE CONGELADO');

INSERT INTO
    sbm_business.transport_type (`type`, description)
VALUES
    ('SECO', 'TRANSPORTE SECO');

INSERT INTO
    sbm_business.transport_type (`type`, description)
VALUES
    ('FRAGIL', 'TRANSPORTE FRAGIL');

-- MEASURE-UNIT
INSERT INTO
    sbm_business.measure_unit (measure_unit, description)
VALUES
    ('KG', 'KILOGRAMOS');

INSERT INTO
    sbm_business.measure_unit (measure_unit, description)
VALUES
    ('G', 'GRAMOS');

INSERT INTO
    sbm_business.measure_unit (measure_unit, description)
VALUES
    ('L', 'LITROS');

INSERT INTO
    sbm_business.measure_unit (measure_unit, description)
VALUES
    ('ML', 'MILILITROS');

INSERT INTO
    sbm_business.measure_unit (measure_unit, description)
VALUES
    ('UN', 'UNIDADES');

INSERT INTO
    sbm_business.measure_unit (measure_unit, description)
VALUES
    ('PZ', 'PIEZAS');

INSERT INTO
    sbm_business.measure_unit (measure_unit, description)
VALUES
    ('M', 'METROS');

INSERT INTO
    sbm_business.measure_unit (measure_unit, description)
VALUES
    ('CM', 'CENTIMETROS');

-- PROVIDER-TYPE
INSERT INTO
    sbm_business.provider_type (`type`, description)
VALUES
    ('PRODUCTOR', 'PRODUCTOR DIRECTO');

INSERT INTO
    sbm_business.provider_type (`type`, description)
VALUES
    ('DISTRIBUIDOR', 'DISTRIBUIDOR');

INSERT INTO
    sbm_business.provider_type (`type`, description)
VALUES
    ('IMPORTADOR', 'IMPORTADOR');

INSERT INTO
    sbm_business.provider_type (`type`, description)
VALUES
    ('MAYORISTA', 'MAYORISTA');

INSERT INTO
    sbm_business.provider_type (`type`, description)
VALUES
    ('MINORISTA', 'MINORISTA');

-- BANK-ACCOUNT-TYPE
INSERT INTO
    sbm_business.bank_account_type (`type`, description)
VALUES
    ('CUENTA CORRIENTE', 'CUENTA CORRIENTE BANCARIA');

INSERT INTO
    sbm_business.bank_account_type (`type`, description)
VALUES
    ('CUENTA VISTA', 'CUENTA VISTA BANCARIA');

INSERT INTO
    sbm_business.bank_account_type (`type`, description)
VALUES
    ('CUENTA RUT', 'CUENTA RUT BANCARIA');

INSERT INTO
    sbm_business.bank_account_type (`type`, description)
VALUES
    ('CUENTA AHORRO', 'CUENTA DE AHORRO BANCARIA');

-- REGION
INSERT INTO
    sbm_business.region (region, description)
VALUES
    ('METROPOLITANA', 'REGION METROPOLITANA DE SANTIAGO');

INSERT INTO
    sbm_business.region (region, description)
VALUES
    ('VALPARAISO', 'REGION DE VALPARAISO');

INSERT INTO
    sbm_business.region (region, description)
VALUES
    ('OHIGGINS', 'REGION DEL LIBERTADOR BERNARDO OHIGGINS');

INSERT INTO
    sbm_business.region (region, description)
VALUES
    ('MAULE', 'REGION DEL MAULE');

INSERT INTO
    sbm_business.region (region, description)
VALUES
    ('BIOBIO', 'REGION DEL BIOBIO');

INSERT INTO
    sbm_business.region (region, description)
VALUES
    ('ARAUCANIA', 'REGION DE LA ARAUCANIA');

INSERT INTO
    sbm_business.region (region, description)
VALUES
    ('LOS LAGOS', 'REGION DE LOS LAGOS');

INSERT INTO
    sbm_business.region (region, description)
VALUES
    ('AYSEN', 'REGION DE AYSEN');

INSERT INTO
    sbm_business.region (region, description)
VALUES
    ('MAGALLANES', 'REGION DE MAGALLANES');

INSERT INTO
    sbm_business.region (region, description)
VALUES
    ('TARAPACA', 'REGION DE TARAPACA');

INSERT INTO
    sbm_business.region (region, description)
VALUES
    ('ANTOFAGASTA', 'REGION DE ANTOFAGASTA');

INSERT INTO
    sbm_business.region (region, description)
VALUES
    ('ATACAMA', 'REGION DE ATACAMA');

INSERT INTO
    sbm_business.region (region, description)
VALUES
    ('COQUIMBO', 'REGION DE COQUIMBO');

INSERT INTO
    sbm_business.region (region, description)
VALUES
    ('ARICA Y PARINACOTA', 'REGION DE ARICA Y PARINACOTA');

INSERT INTO
    sbm_business.region (region, description)
VALUES
    ('LOS RIOS', 'REGION DE LOS RIOS');

INSERT INTO
    sbm_business.region (region, description)
VALUES
    ('ÑUBLE', 'REGION DE ÑUBLE');

-- DISTRICT (SOME EXAMPLES)
INSERT INTO
    sbm_business.district (district, region, description)
VALUES
    ('SANTIAGO', 1, 'COMUNA DE SANTIAGO');

INSERT INTO
    sbm_business.district (district, region, description)
VALUES
    ('PROVIDENCIA', 1, 'COMUNA DE PROVIDENCIA');

INSERT INTO
    sbm_business.district (district, region, description)
VALUES
    ('LAS CONDES', 1, 'COMUNA DE LAS CONDES');

INSERT INTO
    sbm_business.district (district, region, description)
VALUES
    ('ÑUÑOA', 1, 'COMUNA DE ÑUÑOA');

INSERT INTO
    sbm_business.district (district, region, description)
VALUES
    ('MAIPU', 1, 'COMUNA DE MAIPU');

INSERT INTO
    sbm_business.district (district, region, description)
VALUES
    ('PUENTE ALTO', 1, 'COMUNA DE PUENTE ALTO');

INSERT INTO
    sbm_business.district (district, region, description)
VALUES
    ('LA FLORIDA', 1, 'COMUNA DE LA FLORIDA');

INSERT INTO
    sbm_business.district (district, region, description)
VALUES
    ('VALPARAISO', 2, 'COMUNA DE VALPARAISO');

INSERT INTO
    sbm_business.district (district, region, description)
VALUES
    ('VIÑA DEL MAR', 2, 'COMUNA DE VIÑA DEL MAR');

INSERT INTO
    sbm_business.district (district, region, description)
VALUES
    ('RANCAGUA', 3, 'COMUNA DE RANCAGUA');

INSERT INTO
    sbm_business.district (district, region, description)
VALUES
    ('TALCA', 4, 'COMUNA DE TALCA');

INSERT INTO
    sbm_business.district (district, region, description)
VALUES
    ('CONCEPCION', 5, 'COMUNA DE CONCEPCION');

INSERT INTO
    sbm_business.district (district, region, description)
VALUES
    ('TEMUCO', 6, 'COMUNA DE TEMUCO');

INSERT INTO
    sbm_business.district (district, region, description)
VALUES
    ('PUERTO MONTT', 7, 'COMUNA DE PUERTO MONTT');

INSERT INTO
    sbm_business.district (district, region, description)
VALUES
    ('COYHAIQUE', 8, 'COMUNA DE COYHAIQUE');

INSERT INTO
    sbm_business.district (district, region, description)
VALUES
    ('PUNTA ARENAS', 9, 'COMUNA DE PUNTA ARENAS');

INSERT INTO
    sbm_business.district (district, region, description)
VALUES
    ('IQUIQUE', 10, 'COMUNA DE IQUIQUE');

INSERT INTO
    sbm_business.district (district, region, description)
VALUES
    ('ANTOFAGASTA', 11, 'COMUNA DE ANTOFAGASTA');

INSERT INTO
    sbm_business.district (district, region, description)
VALUES
    ('COPIAPO', 12, 'COMUNA DE COPIAPO');

INSERT INTO
    sbm_business.district (district, region, description)
VALUES
    ('LA SERENA', 13, 'COMUNA DE LA SERENA');

INSERT INTO
    sbm_business.district (district, region, description)
VALUES
    ('ARICA', 14, 'COMUNA DE ARICA');

INSERT INTO
    sbm_business.district (district, region, description)
VALUES
    ('VALDIVIA', 15, 'COMUNA DE VALDIVIA');

INSERT INTO
    sbm_business.district (district, region, description)
VALUES
    ('CHILLAN', 16, 'COMUNA DE CHILLAN');

-- FISCAL-DIRECTIVE-TYPE
INSERT INTO
    sbm_business.fiscal_directive_type (type, description)
VALUES
    ('IVA', 'IMPUESTO AL VALOR AGREGADO');

INSERT INTO
    sbm_business.fiscal_directive_type (type, description)
VALUES
    ('RETENCION', 'RETENCION DE IMPUESTOS');

INSERT INTO
    sbm_business.fiscal_directive_type (type, description)
VALUES
    ('EXENTO', 'PRODUCTO EXENTO DE IMPUESTOS');

INSERT INTO
    sbm_business.fiscal_directive_type (type, description)
VALUES
    ('OTRO', 'OTRO TIPO DE IMPUESTO');

-- BANK
INSERT INTO
    sbm_business.bank (bank, description)
VALUES
    ('BANCO DE CHILE', 'BANCO DE CHILE');

INSERT INTO
    sbm_business.bank (bank, description)
VALUES
    ('BANCO ESTADO', 'BANCO DEL ESTADO DE CHILE');

INSERT INTO
    sbm_business.bank (bank, description)
VALUES
    ('BANCO SANTANDER', 'BANCO SANTANDER-CHILE');

INSERT INTO
    sbm_business.bank (bank, description)
VALUES
    ('BANCO BCI', 'BANCO DE CREDITO E INVERSIONES');

INSERT INTO
    sbm_business.bank (bank, description)
VALUES
    ('BANCO SCOTIABANK', 'BANCO SCOTIABANK CHILE');

INSERT INTO
    sbm_business.bank (bank, description)
VALUES
    ('BANCO ITAU', 'BANCO ITAU CHILE');

INSERT INTO
    sbm_business.bank (bank, description)
VALUES
    ('BANCO FALABELLA', 'BANCO FALABELLA');

INSERT INTO
    sbm_business.bank (bank, description)
VALUES
    ('BANCO RIPLEY', 'BANCO RIPLEY');

INSERT INTO
    sbm_business.bank (bank, description)
VALUES
    ('BANCO CONSORCIO', 'BANCO CONSORCIO');

INSERT INTO
    sbm_business.bank (bank, description)
VALUES
    ('BANCO SECURITY', 'BANCO SECURITY');

INSERT INTO
    sbm_business.bank (bank, description)
VALUES
    ('BANCO BICE', 'BANCO BICE');

INSERT INTO
    sbm_business.bank (bank, description)
VALUES
    ('BANCO INTERNACIONAL', 'BANCO INTERNACIONAL');

INSERT INTO
    sbm_business.bank (bank, description)
VALUES
    ('BANCO CORPBANCA', 'BANCO CORPBANCA');

INSERT INTO
    sbm_business.bank (bank, description)
VALUES
    ('BANCO PARIS', 'BANCO PARIS');

INSERT INTO
    sbm_business.bank (bank, description)
VALUES
    ('BANCO EDWARDS', 'BANCO EDWARDS');

INSERT INTO
    sbm_business.bank (bank, description)
VALUES
    ('BANCO BBVA', 'BANCO BBVA CHILE');

INSERT INTO
    sbm_business.bank (bank, description)
VALUES
    ('BANCO BICE', 'BANCO BICE');

INSERT INTO
    sbm_business.bank (bank, description)
VALUES
    ('BANCO INTERNACIONAL', 'BANCO INTERNACIONAL');

INSERT INTO
    sbm_business.bank (bank, description)
VALUES
    ('BANCO CORPBANCA', 'BANCO CORPBANCA');

INSERT INTO
    sbm_business.bank (bank, description)
VALUES
    ('BANCO PARIS', 'BANCO PARIS');

INSERT INTO
    sbm_business.bank (bank, description)
VALUES
    ('BANCO EDWARDS', 'BANCO EDWARDS');

INSERT INTO
    sbm_business.bank (bank, description)
VALUES
    ('BANCO BBVA', 'BANCO BBVA CHILE');