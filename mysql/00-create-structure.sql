GRANT ALL PRIVILEGES ON ditaly_pasta.* TO 'sbmqa'@'%';
GRANT ALL PRIVILEGES ON sbm_business.* TO 'sbmqa'@'%';
GRANT TRIGGER ON ditaly_pasta.* TO 'sbmqa'@'%';
GRANT TRIGGER ON sbm_business.* TO 'sbmqa'@'%';

FLUSH PRIVILEGES;

CREATE SCHEMA IF NOT EXISTS ditaly_pasta;
CREATE SCHEMA IF NOT EXISTS sbm_business;

USE ditaly_pasta;