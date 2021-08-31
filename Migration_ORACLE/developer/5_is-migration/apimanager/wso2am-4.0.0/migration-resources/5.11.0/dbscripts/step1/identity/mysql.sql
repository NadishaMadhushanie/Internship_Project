CREATE TABLE IF NOT EXISTS IDN_CONFIG_TYPE (
    ID VARCHAR(255) NOT NULL,
    NAME VARCHAR(255) NOT NULL,
    DESCRIPTION VARCHAR(1023) NULL,
    PRIMARY KEY (ID),
    CONSTRAINT TYPE_NAME_CONSTRAINT UNIQUE (NAME)
)ENGINE INNODB;

INSERT INTO IDN_CONFIG_TYPE (ID, NAME, DESCRIPTION) VALUES
('9ab0ef95-13e9-4ed5-afaf-d29bed62f7bd', 'IDP_TEMPLATE', 'Template type to uniquely identify IDP templates'),
('3c4ac3d0-5903-4e3d-aaca-38df65b33bfd', 'APPLICATION_TEMPLATE', 'Template type to uniquely identify Application templates');

CREATE TABLE IF NOT EXISTS IDN_CONFIG_RESOURCE (
    ID VARCHAR(255) NOT NULL,
    TENANT_ID INT NOT NULL,
    NAME VARCHAR(255) NOT NULL,
    CREATED_TIME TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    LAST_MODIFIED TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    HAS_FILE tinyint(1) NOT NULL,
    HAS_ATTRIBUTE tinyint(1) NOT NULL,
    TYPE_ID VARCHAR(255) NOT NULL,
    PRIMARY KEY (ID),
    CONSTRAINT NAME_TENANT_TYPE_CONSTRAINT UNIQUE (NAME, TENANT_ID, TYPE_ID)
)ENGINE INNODB;
ALTER TABLE IDN_CONFIG_RESOURCE ADD CONSTRAINT TYPE_ID_FOREIGN_CONSTRAINT FOREIGN KEY (TYPE_ID) REFERENCES
IDN_CONFIG_TYPE (ID) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE IF NOT EXISTS IDN_CONFIG_ATTRIBUTE (
    ID VARCHAR(255) NOT NULL,
    RESOURCE_ID VARCHAR(255) NOT NULL,
    ATTR_KEY VARCHAR(255) NOT NULL,
    ATTR_VALUE VARCHAR(1023) NULL,
    PRIMARY KEY (ID),
    CONSTRAINT RESOURCE_KEY_VAL_CONSTRAINT UNIQUE (RESOURCE_ID(64), ATTR_KEY(255))
)ENGINE INNODB;
ALTER TABLE IDN_CONFIG_ATTRIBUTE ADD CONSTRAINT RESOURCE_ID_ATTRIBUTE_FOREIGN_CONSTRAINT FOREIGN KEY (RESOURCE_ID)
REFERENCES IDN_CONFIG_RESOURCE (ID) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE IF NOT EXISTS IDN_CONFIG_FILE (
    ID VARCHAR(255) NOT NULL,
    VALUE BLOB NULL,
    RESOURCE_ID VARCHAR(255) NOT NULL,
    NAME VARCHAR(255) NULL,
    PRIMARY KEY (ID)
)ENGINE INNODB;
ALTER TABLE IDN_CONFIG_FILE ADD CONSTRAINT RESOURCE_ID_FILE_FOREIGN_CONSTRAINT FOREIGN KEY (RESOURCE_ID) REFERENCES
IDN_CONFIG_RESOURCE (ID) ON DELETE CASCADE ON UPDATE CASCADE;
