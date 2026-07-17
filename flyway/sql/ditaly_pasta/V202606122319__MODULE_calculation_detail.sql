CREATE TABLE IF NOT EXISTS ditaly_pasta.module_calculation_detail (
    id SERIAL PRIMARY KEY,
    calculation_config INTEGER NOT NULL,
    calculation_concept UUID NOT NULL,
    is_required BOOLEAN NOT NULL DEFAULT TRUE,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at DATE DEFAULT CURRENT_DATE,
    updated_at DATE NULL,
    created_by CHAR(36) NOT NULL,
    updated_by CHAR(36) NULL,
    CONSTRAINT fk_calculation_config FOREIGN KEY (calculation_config) REFERENCES ditaly_pasta.module_calculation_config(id),
    CONSTRAINT fk_calculation_concept FOREIGN KEY (calculation_concept) REFERENCES sbm_business.calculation_concept(code),
    CONSTRAINT fk_created_by FOREIGN KEY (created_by) REFERENCES sbm_business.user(code),
    CONSTRAINT fk_updated_by FOREIGN KEY (updated_by) REFERENCES sbm_business.user(code),
    CONSTRAINT uq_module_calculation UNIQUE (calculation_config, calculation_concept)
);