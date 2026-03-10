ALTER TABLE sbm_business.menu
ADD COLUMN background_color CHAR(6) NULL,
ADD COLUMN text_color CHAR(6) NULL;


UPDATE sbm_business.menu SET background_color='FF0000', text_color='FFFFFF' WHERE id=1;
UPDATE sbm_business.menu SET background_color='FFD700', text_color='000000' WHERE id=2;
UPDATE sbm_business.menu SET background_color='800080', text_color='FFFFFF' WHERE id=4;
UPDATE sbm_business.menu SET background_color='87CEEB', text_color='000000' WHERE id=3;
UPDATE sbm_business.menu SET background_color='90EE90', text_color='000000' WHERE id=5;
UPDATE sbm_business.menu SET background_color='006400', text_color='FFFFFF' WHERE id=6;