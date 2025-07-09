-- CROSSDATA: Insertar datos en fiscal_formula solo si existe el usuario admin@sbm.com
DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM sbm_business.user WHERE mail = 'admin@sbm.com') THEN
        INSERT INTO sbm_business.fiscal_formula (id, formula, formula_template, created_by)
        VALUES (gen_random_uuid(), 'SIMPLE_IVA', 'net_amount * 1.19', (SELECT code FROM sbm_business.user WHERE mail = 'admin@sbm.com' LIMIT 1))
        ON CONFLICT DO NOTHING;

        INSERT INTO sbm_business.fiscal_formula (id, formula, formula_template, created_by)
        VALUES (gen_random_uuid(), 'COMPLEX_IVA_RETENTION', 'net_amount * 1.19 - (net_amount * 0.10)', (SELECT code FROM sbm_business.user WHERE mail = 'admin@sbm.com' LIMIT 1))
        ON CONFLICT DO NOTHING;

        INSERT INTO sbm_business.fiscal_formula (id, formula, formula_template, created_by)
        VALUES (gen_random_uuid(), 'EXEMPT_IVA', 'net_amount', (SELECT code FROM sbm_business.user WHERE mail = 'admin@sbm.com' LIMIT 1))
        ON CONFLICT DO NOTHING;
    END IF;
END $$; 