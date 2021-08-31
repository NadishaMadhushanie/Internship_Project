ALTER TABLE CM_PURPOSE
ADD COLUMN PURPOSE_GROUP VARCHAR(255) DEFAULT '' NOT NULL,
ADD COLUMN GROUP_TYPE    VARCHAR(255) DEFAULT '' NOT NULL,
drop CONSTRAINT CM_PURPOSE_CNT ,
ADD CONSTRAINT CM_PURPOSE_CNT UNIQUE  (NAME, TENANT_ID, PURPOSE_GROUP, GROUP_TYPE);

UPDATE CM_PURPOSE
SET
PURPOSE_GROUP =
CASE WHEN NAME = 'DEFAULT' THEN 'DEFAULT' ELSE 'SIGNUP' END;

UPDATE CM_PURPOSE
SET
GROUP_TYPE =
CASE WHEN NAME = 'DEFAULT' THEN 'SP' ELSE 'SYSTEM' end;

ALTER TABLE CM_PURPOSE_PII_CAT_ASSOC
ADD IS_MANDATORY INTEGER DEFAULT 1 NOT NULL;