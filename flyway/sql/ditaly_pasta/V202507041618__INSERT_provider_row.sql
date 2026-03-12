ALTER TABLE ditaly_pasta.provider
ALTER COLUMN code TYPE VARCHAR(10);

-- Insertar registro inicial en ditaly_pasta.provider
INSERT INTO ditaly_pasta.provider
(id, code, provider, "type", rating, obs_provider, contact_name, contact_mail, contact_phone, contact_phone2, website_url, obs_contact, company_name, company_rut, company_activity, legal_representative, billing_address, billing_mail, billing_phone, company_bank, bank_account_type, bank_account_number, bank_account_mail, dispatch_address, dispatch_maps_location, obs_dispatch, dispatch_district, dispatch_region, is_active, is_deleted, is_confirmed, created_at, updated_at, confirmed_at, deleted_at, created_by, confirmed_by, updated_by, deleted_by, log, "version")
VALUES(
1,
'PVP-001',
'VERONA - PASIONES ITALIANAS',
1,
4,
'proveedor de pastas y salsas 1',
'CLAUDIA MARTINEZ',
NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,
NULL,NULL,NULL,
NULL,NULL,NULL,NULL,
NULL,NULL,NULL,
NULL,NULL,
true,
NULL,
true,
'2025-07-19 20:32:35.579',
NULL,
'2025-07-19 20:32:35.579',
NULL,
'5fbf2886-4ad0-11f0-8ce6-0242ac120002',
'5fbf2886-4ad0-11f0-8ce6-0242ac120002',
NULL,
NULL,
'init;',
1
);


