-- MENU
INSERT INTO
    ditaly_pasta.menu (menu, description)
VALUES
    ('BELLAVITA', 'Carta de pasta 1');

INSERT INTO
    ditaly_pasta.menu (menu, description)
VALUES
    ('VEROGUSTO', 'Carta de pasta 2');

INSERT INTO
    ditaly_pasta.menu (menu, description)
VALUES
    ('DESECHABLE', 'Carta general desechables');

INSERT INTO
    ditaly_pasta.menu (menu, description)
VALUES
    ('DOLCEZZA', 'Carta de postres 1');

INSERT INTO
    ditaly_pasta.menu (menu, description)
VALUES
    (
        'SERVICIOS INTERNOS',
        'Carta de servicios internos'
    );

INSERT INTO
    ditaly_pasta.menu (menu, description)
VALUES
    (
        'SERVICIOS EXTERNOS',
        'Carta de servicios externos'
    );

-- ITEM-GROUP
INSERT INTO
    ditaly_pasta.item_group (group_name, description, cataloge_render)
VALUES
('GRANEL', 'ENVASE CON CONTENIDO A GRANEL', 1);

INSERT INTO
    ditaly_pasta.item_group (group_name, description, cataloge_render)
VALUES
('UNIDAD', 'UNIDAD', 0);

INSERT INTO
    ditaly_pasta.item_group (group_name, description, cataloge_render)
VALUES
('BANDEJA', 'BANDEJA', 0);

INSERT INTO
    ditaly_pasta.item_group (group_name, description, cataloge_render)
VALUES
(
        'TIENDA',
        'PRESENTACION PARA VENTA DIRECTA COMENSAL',
        0
    );

INSERT INTO
    ditaly_pasta.item_group (group_name, description, cataloge_render)
VALUES
('SERVICIO', 'SERVICIO INTERNO O EXTERNO', 0);

-- ITEM-CATEGORY
INSERT INTO
    ditaly_pasta.item_category (category, description, cataloge_render)
VALUES
    ('PASTA', 'PRODUCTO PASTA LISA O RELLENA', 1);

INSERT INTO
    ditaly_pasta.item_category (category, description, cataloge_render)
VALUES
    ('SALSA', 'PRODUCTO SALSA PARA PASTA', 1);

INSERT INTO
    ditaly_pasta.item_category (category, description, cataloge_render)
VALUES
    ('BEBESTIBLE', 'PRODUCTO BEBIDA O AGUA FRIA', 0);

INSERT INTO
    ditaly_pasta.item_category (category, description, cataloge_render)
VALUES
    (
        'DESECHABLE',
        'PRODUCTO DESECHABLE DE ENVASES O VASOS',
        0
    );

INSERT INTO
    ditaly_pasta.item_category (category, description, cataloge_render)
VALUES
    ('PASTELERIA', 'PRODUCTO PASTELERIA', 0);

INSERT INTO
    ditaly_pasta.item_category (category, description, cataloge_render)
VALUES
    ('SANDWICH', 'PRODUCTO SANDWICH', 0);

INSERT INTO
    ditaly_pasta.item_category (category, description, cataloge_render)
VALUES
    (
        'CONDIMIENTO',
        'PRODUCTO DE CONDIMENTO PARA ALIMENTOS',
        0
    );

-- ITEM-TYPE
INSERT INTO
    ditaly_pasta.item_type (id, `type`, description)
VALUES
    (
        1,
        'PRODUCTO CONGELADO',
        'PRODUCTO QUE REQUIERE CONGELAMIENTO (-18C)'
    );

INSERT INTO
    ditaly_pasta.item_type (id, `type`, description)
VALUES
    (
        2,
        'PRODUCTO REFRIGERADO',
        'PRODUCTO QUE REQUIERE REFRIGERACION'
    );

INSERT INTO
    ditaly_pasta.item_type (id, `type`, description)
VALUES
    (3, 'MATERIAL', 'PRODUCTO NO-ALIMENTICIO');

INSERT INTO
    ditaly_pasta.item_type (id, `type`, description)
VALUES
    (
        4,
        'PRODUCTO ALMACEN',
        'PRODUCTO SIMPLE QUE NO REQUIERE REFRIGERACION'
    );

INSERT INTO
    ditaly_pasta.item_type (id, `type`, description)
VALUES
    (5, 'SERVICIO', 'SERVICIO INTERNO O EXTERNO');

-- USER-TYPE
INSERT INTO
    ditaly_pasta.user_type (id, `type`, description, created_at)
VALUES
    (1, 'ADMIN', 'SYSADMIN', '2025-06-16 16:19:23');

INSERT INTO
    ditaly_pasta.user_type (id, `type`, description, created_at)
VALUES
    (
        2,
        'DISTRIBUCION',
        'CLIENTE DISTRIBUCION',
        '2025-06-16 16:19:23'
    );

INSERT INTO
    ditaly_pasta.user_type (id, `type`, description, created_at)
VALUES
    (
        3,
        'FRANQUICIA',
        'CLIENTE FRANQUICIA',
        '2025-06-16 16:19:23'
    );

INSERT INTO
    ditaly_pasta.user_type (id, `type`, description, created_at)
VALUES
    (
        4,
        'VISITA',
        'USUARIO VISITA',
        '2025-06-16 16:19:23'
    );

-- PACKAGE-TYPE
INSERT INTO
    ditaly_pasta.package_type (`type`, description)
VALUES
    ('CAJA', 'ENVASE TIPO CAJA CARTON');

INSERT INTO
    ditaly_pasta.package_type (`type`, description)
VALUES
    ('BANDEJA', 'BANDEJA PARA USO DESECHABLE');

INSERT INTO
    ditaly_pasta.package_type (`type`, description)
VALUES
    ('CANASTO', 'CANASTO PLASTICO REUTILIZABLE');

-- TRANSPORT-TYPE
INSERT INTO
    ditaly_pasta.transport_type (`type`, description)
VALUES
    (
        'CONGELADO',
        'TRANSPORTE CAMION/FURGON CON FRIGORIFICO'
    );

INSERT INTO
    ditaly_pasta.transport_type (`type`, description)
VALUES
    ('SIMPLE', 'TRANSPORTE AUTO/CAMIONETA PEQUEÑA');

INSERT INTO
    ditaly_pasta.transport_type (`type`, description)
VALUES
    (
        'FLETES',
        'TRANSPORTE CAMION/CAMIONETA/FURGON PARA FLETES'
    );

-- MEASURE-UNIT
INSERT INTO
    ditaly_pasta.measure_unit (measure_unit, description)
VALUES
    ('GR', 'GRAMOS');

INSERT INTO
    ditaly_pasta.measure_unit (measure_unit, description)
VALUES
    ('KG', 'KILOS');

INSERT INTO
    ditaly_pasta.measure_unit (measure_unit, description)
VALUES
    ('ML', 'MILILITROS');

INSERT INTO
    ditaly_pasta.measure_unit (measure_unit, description)
VALUES
    ('LT', 'LITROS');

INSERT INTO
    ditaly_pasta.measure_unit (measure_unit, description)
VALUES
    ('UNIDAD', 'UNIDAD POR EMBALAJE');