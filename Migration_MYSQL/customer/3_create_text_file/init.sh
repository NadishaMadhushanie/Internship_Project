#!/bin/sh

mysql --version

VAR1=root
VAR2=pwd
VAR3=172.18.0.2

mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as am_alert_types from apim_db.AM_ALERT_TYPES' | sed -z 's/\n/,/g;s/,$/\n/' > /test/output.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as am_api from apim_db.AM_API' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as am_api_lc_event from apim_db.AM_API_LC_EVENT' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as am_api_ratings from apim_db.AM_API_RATINGS' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as am_api_throttle_policy from apim_db.AM_API_THROTTLE_POLICY' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as am_application from apim_db.AM_APPLICATION' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as am_application_key_mapping from apim_db.AM_APPLICATION_KEY_MAPPING' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as am_application_registration from apim_db.AM_APPLICATION_REGISTRATION' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as am_key_manager from apim_db.AM_KEY_MANAGER' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as am_policy_application from apim_db.AM_POLICY_APPLICATION' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as am_policy_subscription from apim_db.AM_POLICY_SUBSCRIPTION' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as am_subscriber from apim_db.AM_SUBSCRIBER' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as am_subscription from apim_db.AM_SUBSCRIPTION' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as am_system_apps from apim_db.AM_SYSTEM_APPS' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt

mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as cm_purpose from apim_db.CM_PURPOSE' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as cm_purpose_category from apim_db.CM_PURPOSE_CATEGORY' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as idn_auth_session_app_info from apim_db.IDN_AUTH_SESSION_APP_INFO' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as idn_auth_session_meta_data from apim_db.IDN_AUTH_SESSION_META_DATA' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as idn_auth_session_store from apim_db.IDN_AUTH_SESSION_STORE' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as idn_auth_temp_session_store from apim_db.IDN_AUTH_TEMP_SESSION_STORE' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as idn_auth_user_session_mapping from apim_db.IDN_AUTH_USER_SESSION_MAPPING' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as idn_base_table from apim_db.IDN_BASE_TABLE' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as idn_claim_dialect from apim_db.IDN_CLAIM_DIALECT' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as idn_oauth2_access_token from apim_db.IDN_OAUTH2_ACCESS_TOKEN' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as idn_oauth2_access_token_scope from apim_db.IDN_OAUTH2_ACCESS_TOKEN_SCOPE' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as idn_oauth2_authorization_code from apim_db.IDN_OAUTH2_AUTHORIZATION_CODE' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as idn_oauth2_authz_code_scope from apim_db.IDN_OAUTH2_AUTHZ_CODE_SCOPE' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as idn_oauth2_scope from apim_db.IDN_OAUTH2_SCOPE' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as idn_oauth2_scope_binding from apim_db.IDN_OAUTH2_SCOPE_BINDING' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as idn_oauth_consumer_apps from apim_db.IDN_OAUTH_CONSUMER_APPS' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as idn_oidc_property from apim_db.IDN_OIDC_PROPERTY' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as idn_oidc_scope_claim_mapping from apim_db.IDN_OIDC_SCOPE_CLAIM_MAPPING' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as idp from apim_db.IDP' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as idp_authenticator from apim_db.IDP_AUTHENTICATOR' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as idp_authenticator_property from apim_db.IDP_AUTHENTICATOR_PROPERTY' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as idp_metadata from apim_db.IDP_METADATA' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as sp_app from apim_db.SP_APP' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as sp_inbound_auth from apim_db.SP_INBOUND_AUTH' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as sp_metadata from apim_db.SP_METADATA' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt


mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as reg_association from shared_db.REG_ASSOCIATION' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as um_domain from shared_db.UM_DOMAIN' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as um_role from shared_db.UM_ROLE' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as um_system_role from shared_db.UM_SYSTEM_ROLE' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as um_system_user_role from shared_db.UM_SYSTEM_USER_ROLE' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as um_user_role from shared_db.UM_USER_ROLE' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt

mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*)  as am_labels from apim_db.AM_LABELS' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt


mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select COALESCE(sum(crc32(concat(API_ID,API_PROVIDER,API_NAME,API_VERSION,CONTEXT,CONTEXT_TEMPLATE,API_TYPE))),0) as am_api_sum from apim_db.AM_API' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select COALESCE(sum(crc32(LABEL_ID)),0) as am_labels_sum1 from apim_db.AM_LABELS' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select COALESCE(sum(crc32(concat(NAME,DESCRIPTION))),0) as am_labels_sum2 from apim_db.AM_LABELS' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select COALESCE(sum(crc32(concat(UUID,APPLICATION_ID,CONSUMER_KEY,KEY_TYPE,STATE,CREATE_MODE,APP_INFO))),0) as am_application_key_mapping_sum from apim_db.AM_APPLICATION_KEY_MAPPING' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/output.txt







