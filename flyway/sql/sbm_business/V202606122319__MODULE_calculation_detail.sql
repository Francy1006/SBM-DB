CREATE TABLE IF NOT EXISTS sbm_business.module_calculation_detail (
    id SERIAL PRIMARY KEY,
    module INTEGER NOT NULL,
    calculation_concept CHAR(36) NOT NULL,
    format_type VARCHAR(50) NOT NULL DEFAULT 'currency_int',
    is_required BOOLEAN NOT NULL DEFAULT TRUE,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at DATE DEFAULT CURRENT_DATE,
    updated_at DATE NULL,
    created_by CHAR(36) NOT NULL,
    updated_by CHAR(36) NULL,

    CONSTRAINT fk_module
        FOREIGN KEY (module)
        REFERENCES sbm_business.module(id),

    CONSTRAINT fk_calculation_concept
        FOREIGN KEY (calculation_concept)
        REFERENCES sbm_business.calculation_concept(code),

    CONSTRAINT fk_created_by
        FOREIGN KEY (created_by)
        REFERENCES sbm_business.user(code),

    CONSTRAINT fk_updated_by
        FOREIGN KEY (updated_by)
        REFERENCES sbm_business.user(code),

    CONSTRAINT uq_module_calculation UNIQUE (module, calculation_concept)
);

ALTER TABLE sbm_business.module_calculation_detail ALTER COLUMN "module" TYPE int USING "module"::int;
