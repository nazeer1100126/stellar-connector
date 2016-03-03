CREATE TABLE stellar_account_bridge_key (
  id              BIGINT GENERATED BY DEFAULT AS IDENTITY (
  START WITH 1
  INCREMENT BY 1 )                                                               NOT NULL,
  mifos_tenant_id VARCHAR(40)                                                    NOT NULL,
  rest_api_key    VARCHAR(40)                                                    NOT NULL,
  UNIQUE (mifos_tenant_id)
);


CREATE TABLE stellar_account_bridge (
  id                      BIGINT GENERATED BY DEFAULT AS IDENTITY (
  START WITH 1
  INCREMENT BY 1 )                                                               NOT NULL,
  mifos_tenant_id                   VARCHAR(40)                                  NOT NULL,
  mifos_token                       VARCHAR(256)                                 NOT NULL,
  mifos_staging_account             VARCHAR(60)                                  NOT NULL,
  endpoint                          VARCHAR(256)                                 NOT NULL,
  stellar_account_id                VARCHAR(60)                                  NOT NULL,
  stellar_account_private_key       VARCHAR(60)                                  NOT NULL,
  stellar_vault_account_id          VARCHAR(60),
  stellar_vault_account_private_key VARCHAR(60),
  UNIQUE (mifos_tenant_id)
);

CREATE TABLE fineract_payment_event (
  id                  BIGINT GENERATED BY DEFAULT AS IDENTITY (
  START WITH 1
  INCREMENT BY 1 )                                                               NOT NULL,
  payload             VARCHAR(4096)                                              NOT NULL,
  processed           BOOLEAN                                                    NOT NULL,
  outstanding_retries INT,
  error_message       VARCHAR(256),
  created_on          TIMESTAMP                                                  NOT NULL,
  last_modified_on    TIMESTAMP                                                  NOT NULL
);

CREATE TABLE stellar_adjust_offer_event (
  id                  BIGINT GENERATED BY DEFAULT AS IDENTITY (
  START WITH 1
  INCREMENT BY 1 )                                                               NOT NULL,
  mifos_tenant_id     VARCHAR(60)                                                NOT NULL,
  asset_code          VARCHAR(12)                                                NOT NULL,
  processed           BOOLEAN                                                    NOT NULL,
  outstanding_retries INT,
  error_message       VARCHAR(256),
  created_on          TIMESTAMP                                                  NOT NULL
);

CREATE TABLE stellar_payment_event (
  id                  BIGINT GENERATED BY DEFAULT AS IDENTITY (
  START WITH 1
  INCREMENT BY 1 )                                                               NOT NULL,
  mifos_tenant_id                   VARCHAR(40)                                  NOT NULL,
  asset_code          VARCHAR(12)                                                NOT NULL,
  amount              DOUBLE                                                     NOT NULL,
  processed           BOOLEAN                                                    NOT NULL,
  error_message       VARCHAR(256),
  created_on          TIMESTAMP                                                  NOT NULL
);

CREATE TABLE stellar_cursor (
  id               BIGINT GENERATED BY DEFAULT AS IDENTITY (
  START WITH 1
  INCREMENT BY 1 )                                                               NOT NULL,
  cursor           VARCHAR(50)                                                   NOT NULL,
  processed        BOOLEAN                                                       NOT NULL,
  created_on       TIMESTAMP                                                     NOT NULL
);

CREATE TABLE orphaned_stellar_account (
  id                          BIGINT GENERATED BY DEFAULT AS IDENTITY (
  START WITH 1
  INCREMENT BY 1 )                                                               NOT NULL,
  mifos_tenant_id             VARCHAR(40)                                        NOT NULL,
  stellar_account_id          VARCHAR(60)                                        NOT NULL,
  stellar_account_private_key VARCHAR(60)                                        NOT NULL,
  last_cursor                 VARCHAR(50)                                        NOT NULL,
  vault_account               BOOLEAN                                            NOT NULL
);
