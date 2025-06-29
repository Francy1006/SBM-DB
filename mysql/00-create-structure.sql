GRANT ALL PRIVILEGES ON ditaly_pasta.* TO 'sbmqa' @'%';
GRANT TRIGGER ON ditaly_pasta.* TO 'sbmqa'@'%';

FLUSH PRIVILEGES;

CREATE SCHEMA IF NOT EXISTS ditaly_pasta;

USE ditaly_pasta;