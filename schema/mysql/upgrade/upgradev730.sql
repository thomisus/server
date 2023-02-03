DELIMITER DLM00

DROP PROCEDURE IF EXISTS upgrade730 DLM00

CREATE PROCEDURE upgrade730()
BEGIN
	
	IF (SELECT DATA_TYPE FROM information_schema.`COLUMNS` WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'doc_changes' AND COLUMN_NAME = 'change_data') <> 'longblob' THEN
		SET SQL_SAFE_UPDATES=0;
		ALTER TABLE `doc_changes` CHANGE COLUMN `change_data` `change_data` LONGBLOB NOT NULL ;
		SET SQL_SAFE_UPDATES=1;
	END IF;

END DLM00

CALL upgrade730() DLM00

DELIMITER ;
