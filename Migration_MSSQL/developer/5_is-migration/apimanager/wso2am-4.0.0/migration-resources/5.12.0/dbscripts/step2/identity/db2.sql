CREATE TABLE IDN_OAUTH2_USER_CONSENT (
    ID INTEGER NOT NULL,
    USER_ID VARCHAR(255) NOT NULL,
    APP_ID CHAR(36) NOT NULL,
    TENANT_ID INTEGER NOT NULL DEFAULT -1,
    CONSENT_ID VARCHAR(255) NOT NULL,

    PRIMARY KEY (ID),
    FOREIGN KEY (APP_ID) REFERENCES SP_APP (UUID) ON DELETE CASCADE,
    UNIQUE (USER_ID, APP_ID, TENANT_ID),
    UNIQUE (CONSENT_ID)
)
/
CREATE SEQUENCE IDN_OAUTH2_USER_CONSENT_PK_SEQ START WITH 1 INCREMENT BY 1 NOCACHE
/
CREATE TRIGGER IDN_OAUTH2_USER_CONSENT_TRIG NO CASCADE
    BEFORE INSERT
    ON IDN_OAUTH2_USER_CONSENT
    REFERENCING NEW AS NEW
    FOR EACH ROW MODE DB2SQL
        BEGIN ATOMIC
            SET (NEW.ID) = (NEXTVAL FOR IDN_OAUTH2_USER_CONSENT_PK_SEQ);
        END
/

CREATE TABLE IDN_OAUTH2_USER_CONSENTED_SCOPES (
    ID INTEGER NOT NULL,
    CONSENT_ID VARCHAR(255) NOT NULL,
    TENANT_ID INTEGER NOT NULL DEFAULT -1,
    SCOPE VARCHAR(255) NOT NULL,
    CONSENT BOOLEAN WITH DEFAULT TRUE,

    PRIMARY KEY (ID),
    FOREIGN KEY (CONSENT_ID) REFERENCES IDN_OAUTH2_USER_CONSENT (CONSENT_ID) ON DELETE CASCADE,
    UNIQUE (CONSENT_ID, SCOPE)
)
/
CREATE SEQUENCE IDN_OAUTH2_USER_CONSENTED_SCOPES_PK_SEQ START WITH 1 INCREMENT BY 1 NOCACHE
/
CREATE TRIGGER IDN_OAUTH2_USER_CONSENTED_SCOPES_TRIG NO CASCADE
    BEFORE INSERT
    ON IDN_OAUTH2_USER_CONSENTED_SCOPES
    REFERENCING NEW AS NEW
    FOR EACH ROW MODE DB2SQL
        BEGIN ATOMIC
            SET (NEW.ID) = (NEXTVAL FOR IDN_OAUTH2_USER_CONSENTED_SCOPES_PK_SEQ);
        END
/