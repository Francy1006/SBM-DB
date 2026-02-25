
INSERT INTO ditaly_pasta.client (
code,franchise,detection_date,status,platform,exact_address,district,region,same_address_detected,
estimated_type,operation_schedule,estimated_avg_ticket,has_visible_physical_store,
company_name,company_rut,owner_name,owner_position,linkedin_url,
direct_phone,direct_email,contacted,contact_date,progress,
estimated_potential_volume,priority,observations,
is_active,is_deleted,created_by,log,version
) VALUES
(NULL,'ea2c80ca-7816-4c54-ae3b-282118a9ab0c','2026-02-16',2,1,'Manuel Montt 871',1,1,true,
'Multimarca activo','11:30–21:00',10000,true,
NULL,NULL,NULL,NULL,NULL,
'56986610375',NULL,true,NULL,'Llamar sábado o domingo 22 feb (vacaciones)',
NULL,'Medio','Misma dirección opera 2 marcas chinas',
true,NULL,'5fbf2886-4ad0-11f0-8ce6-0242ac120002','init;',1),
(NULL,'ea2c80ca-7816-4c54-ae3b-282118a9ab0c','2026-02-16',2,1,'Amunátegui 21, Santiago',2,1,false,
'Restaurante físico tradicional','11:00–20:30',9000,true,
NULL,NULL,NULL,NULL,NULL,
'956582650',NULL,false,NULL,NULL,
1200000,'Bajo','Bajo volumen digital, potencial optimización delivery',
true,NULL,'5fbf2886-4ad0-11f0-8ce6-0242ac120002','init;',1),
(NULL,'ea2c80ca-7816-4c54-ae3b-282118a9ab0c','2026-02-16',2,1,'Av. Simón Bolívar 3702, Ñuñoa',3,1,true,
'Multimarca activo',NULL,NULL,true,
NULL,NULL,NULL,NULL,NULL,
NULL,NULL,false,NULL,NULL,
NULL,'Medio','Multimarca aparente, infraestructura cocina caliente',
true,NULL,'5fbf2886-4ad0-11f0-8ce6-0242ac120002','init;',1),
(NULL,'ea2c80ca-7816-4c54-ae3b-282118a9ab0c','2026-02-16',2,1,'San Francisco 363, Santiago',2,1,true,
'Multimarca activo',NULL,NULL,true,
NULL,NULL,NULL,NULL,NULL,
'232854714',NULL,false,NULL,NULL,
NULL,'Medio','Multimarca aparente, baja consolidación',
true,NULL,'5fbf2886-4ad0-11f0-8ce6-0242ac120002','init;',1),
(NULL,'ea2c80ca-7816-4c54-ae3b-282118a9ab0c','2026-02-16',8,1,'Apoquindo Este 4411, Las Condes',4,1,true,
'Multimarca activo',NULL,NULL,true,
NULL,NULL,NULL,NULL,NULL,
NULL,NULL,false,NULL,NULL,
NULL,'Bajo','Ubicado en MUT, infraestructura cocina probable',
true,NULL,'5fbf2886-4ad0-11f0-8ce6-0242ac120002','init;',1),
(NULL,'ea2c80ca-7816-4c54-ae3b-282118a9ab0c','2026-02-16',2,1,'Av. Irarrázaval 3267, Ñuñoa',3,1,true,
'Multimarca activo',NULL,NULL,true,
NULL,NULL,NULL,NULL,NULL,
'934047837',NULL,false,NULL,'Llamar próxima semana (vacaciones)',
NULL,'Medio','Infraestructura flexible para marca virtual',
true,NULL,'5fbf2886-4ad0-11f0-8ce6-0242ac120002','init;',1);



-- CLIENT 1 (Manuel Montt 871)
INSERT INTO ditaly_pasta.client_brand
(client, brand_name, is_active, created_at, created_by)
VALUES
('151bd1ca-ed69-4dd0-9aa5-2edabfda2750', 'Comida Feliz', true, CURRENT_TIMESTAMP, '5fbf2886-4ad0-11f0-8ce6-0242ac120002'),
('151bd1ca-ed69-4dd0-9aa5-2edabfda2750', 'Excelencia China', true, CURRENT_TIMESTAMP, '5fbf2886-4ad0-11f0-8ce6-0242ac120002');

-- CLIENT 2 (Amunátegui 21)
INSERT INTO ditaly_pasta.client_brand
(client, brand_name, is_active, created_at, created_by)
VALUES
('aeee4a1e-c879-41df-9aa9-544c2cad61b4', 'Resto y Café Torre21', true, CURRENT_TIMESTAMP, '5fbf2886-4ad0-11f0-8ce6-0242ac120002');

-- CLIENT 3 (Simón Bolívar 3702)
INSERT INTO ditaly_pasta.client_brand
(client, brand_name, is_active, created_at, created_by)
VALUES
('34a01379-d9e3-49a3-ac9b-90ec3230e84a', 'Que Sopaipillas🇨🇱', true, CURRENT_TIMESTAMP, '5fbf2886-4ad0-11f0-8ce6-0242ac120002');

-- CLIENT 4 (San Francisco 363)
INSERT INTO ditaly_pasta.client_brand
(client, brand_name, is_active, created_at, created_by)
VALUES
('d9fc695c-4844-49f3-9eb0-6320cc9d3fa5', 'Bienmesabe Santiago', true, CURRENT_TIMESTAMP, '5fbf2886-4ad0-11f0-8ce6-0242ac120002');

-- CLIENT 5 (Apoquindo Este 4411)
INSERT INTO ditaly_pasta.client_brand
(client, brand_name, is_active, created_at, created_by)
VALUES
('409ce9ae-f0d5-486b-9d39-6096408a89ba', 'Huentelauquen', true, CURRENT_TIMESTAMP, '5fbf2886-4ad0-11f0-8ce6-0242ac120002');

-- CLIENT 6 (Irarrázaval 3267)
INSERT INTO ditaly_pasta.client_brand
(client, brand_name, is_active, created_at, created_by)
VALUES
('567823fc-fd7f-40a8-98ef-370c0637447d', 'Sanguchería Petrü', true, CURRENT_TIMESTAMP, '5fbf2886-4ad0-11f0-8ce6-0242ac120002');

