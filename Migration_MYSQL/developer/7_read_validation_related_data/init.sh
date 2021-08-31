#!/bin/sh

mysql --version

VAR1=root
VAR2=pwd
VAR3=172.18.0.2

mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'SELECT schema_name as dbName_apimDB FROM information_schema.schemata WHERE schema_name="apim_db"' | sed -z 's/\n/,/g;s/,$/\n/' > /test/validationData.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'SELECT schema_name as dbName_sharedDB FROM information_schema.schemata WHERE schema_name="shared_db"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt


mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'SELECT count(*) as tablesCount_apimDB FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA="apim_db"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'SELECT count(*) as tablesCount_sharedDB FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA="shared_db"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt 


mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'SELECT table_name as tableName_amAPI FROM information_schema.tables WHERE table_type = "base table" AND table_name="AM_API"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'SELECT table_name as tableName_amApiClientCertificate FROM information_schema.tables WHERE table_type = "base table" AND table_name="AM_API_CLIENT_CERTIFICATE"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'SELECT table_name as tableName_amApiComments FROM information_schema.tables WHERE table_type = "base table" AND table_name="AM_API_COMMENTS"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'SELECT table_name as tableName_amApiProductMapping FROM information_schema.tables WHERE table_type = "base table" AND table_name="AM_API_PRODUCT_MAPPING"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'SELECT table_name as tableName_amApiUrlMapping FROM information_schema.tables WHERE table_type = "base table" AND table_name="AM_API_URL_MAPPING"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'SELECT table_name as tableName_amCertificateMetadata FROM information_schema.tables WHERE table_type = "base table" AND table_name="AM_CERTIFICATE_METADATA"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'SELECT table_name as tableName_amGraphqlComplexity FROM information_schema.tables WHERE table_type = "base table" AND table_name="AM_GRAPHQL_COMPLEXITY"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'SELECT table_name as tableName_amGwApiArtifacts FROM information_schema.tables WHERE table_type = "base table" AND table_name="AM_GW_API_ARTIFACTS"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'SELECT table_name as tableName_amGwPublishedApiDetails FROM information_schema.tables WHERE table_type = "base table" AND table_name="AM_GW_PUBLISHED_API_DETAILS"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'SELECT table_name as tableName_amPolicySubscription FROM information_schema.tables WHERE table_type = "base table" AND table_name="AM_POLICY_SUBSCRIPTION"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt


mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'SELECT table_name as tableName_amApiServiceMapping FROM information_schema.tables WHERE table_type = "base table" AND table_name="AM_API_SERVICE_MAPPING"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'SELECT table_name as tableName_amDeploymentRevisionMapping FROM information_schema.tables WHERE table_type = "base table" AND table_name="AM_DEPLOYMENT_REVISION_MAPPING"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'SELECT table_name as tableName_amGatewayEnvironment FROM information_schema.tables WHERE table_type = "base table" AND table_name="AM_GATEWAY_ENVIRONMENT"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'SELECT table_name as tableName_amGwApiDeployments FROM information_schema.tables WHERE table_type = "base table" AND table_name="AM_GW_API_DEPLOYMENTS"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'SELECT table_name as tableName_amGwVhost FROM information_schema.tables WHERE table_type = "base table" AND table_name="AM_GW_VHOST"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'SELECT table_name as tableName_amRevision FROM information_schema.tables WHERE table_type = "base table" AND table_name="AM_REVISION"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'SELECT table_name as tableName_amServiceCatalog FROM information_schema.tables WHERE table_type = "base table" AND table_name="AM_SERVICE_CATALOG"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'SELECT table_name as tableName_amWebhooksSubscription FROM information_schema.tables WHERE table_type = "base table" AND table_name="AM_WEBHOOKS_SUBSCRIPTION"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'SELECT table_name as tableName_amWebhooksUnsubscription FROM information_schema.tables WHERE table_type = "base table" AND table_name="AM_WEBHOOKS_UNSUBSCRIPTION"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'SELECT table_name as tableName_IdnConfigAttribute FROM information_schema.tables WHERE table_type = "base table" AND table_name="IDN_CONFIG_ATTRIBUTE"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'SELECT table_name as tableName_IdnConfigFile FROM information_schema.tables WHERE table_type = "base table" AND table_name="IDN_CONFIG_FILE"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'SELECT table_name as tableName_IdnConfigResource FROM information_schema.tables WHERE table_type = "base table" AND table_name="IDN_CONFIG_RESOURCE"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'SELECT table_name as tableName_IdnConfigType FROM information_schema.tables WHERE table_type = "base table" AND table_name="IDN_CONFIG_TYPE"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'SELECT table_name as tableName_IdnCorsAssociation FROM information_schema.tables WHERE table_type = "base table" AND table_name="IDN_CORS_ASSOCIATION"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'SELECT table_name as tableName_IdnCorsOrigin FROM information_schema.tables WHERE table_type = "base table" AND table_name="IDN_CORS_ORIGIN"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'SELECT table_name as tableName_IdnRemoteFetchConfig FROM information_schema.tables WHERE table_type = "base table" AND table_name="IDN_REMOTE_FETCH_CONFIG"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'SELECT table_name as tableName_IdnRemoteFetchRevisions FROM information_schema.tables WHERE table_type = "base table" AND table_name="IDN_REMOTE_FETCH_REVISIONS"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'SELECT table_name as tableName_IdnUserFunctionalityMapping FROM information_schema.tables WHERE table_type = "base table" AND table_name="IDN_USER_FUNCTIONALITY_MAPPING"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'SELECT table_name as tableName_IdnUserFunctionalityProperty FROM information_schema.tables WHERE table_type = "base table" AND table_name="IDN_USER_FUNCTIONALITY_PROPERTY"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'SELECT table_name as tableName_amApirevisionMetadata FROM information_schema.tables WHERE table_type = "base table" AND table_name="AM_API_REVISION_METADATA"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt


mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'SELECT table_name as tableName_amLabels FROM information_schema.tables WHERE table_type = "base table" AND table_name="AM_LABELS"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'SELECT table_name as tableName_amLabelUrls FROM information_schema.tables WHERE table_type = "base table" AND table_name="AM_LABEL_URLS"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt


mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'SELECT table_name as tableName_umHybridGroupRole FROM information_schema.tables WHERE table_type = "base table" AND table_name="UM_HYBRID_GROUP_ROLE"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'SELECT table_name as tableName_umTenant FROM information_schema.tables WHERE table_type = "base table" AND table_name="UM_TENANT"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt


mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as columnsCount_amAPI from INFORMATION_SCHEMA.COLUMNS where table_schema = "apim_db" and table_name = "AM_API"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as columnsCount_amApiClientCertificate from INFORMATION_SCHEMA.COLUMNS where table_schema = "apim_db" and table_name = "AM_API_CLIENT_CERTIFICATE"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as columnsCount_amApiComments from INFORMATION_SCHEMA.COLUMNS where table_schema = "apim_db" and table_name = "AM_API_COMMENTS"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as columnsCount_amApiProductMapping from INFORMATION_SCHEMA.COLUMNS where table_schema = "apim_db" and table_name = "AM_API_PRODUCT_MAPPING"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as columnsCount_amApiUrlMapping from INFORMATION_SCHEMA.COLUMNS where table_schema = "apim_db" and table_name = "AM_API_URL_MAPPING"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as columnsCount_amCertificateMetadata from INFORMATION_SCHEMA.COLUMNS where table_schema = "apim_db" and table_name = "AM_CERTIFICATE_METADATA"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as columnsCount_amGraphqlComplexity from INFORMATION_SCHEMA.COLUMNS where table_schema = "apim_db" and table_name = "AM_GRAPHQL_COMPLEXITY"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as columnsCount_amGwApiArtifacts from INFORMATION_SCHEMA.COLUMNS where table_schema = "apim_db" and table_name = "AM_GW_API_ARTIFACTS"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as columnsCount_amGwPublishedApiDetails from INFORMATION_SCHEMA.COLUMNS where table_schema = "apim_db" and table_name = "AM_GW_PUBLISHED_API_DETAILS"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt
mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as columnsCount_amPolicySubscription from INFORMATION_SCHEMA.COLUMNS where table_schema = "apim_db" and table_name = "AM_POLICY_SUBSCRIPTION"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt


mysql -h $VAR3 -u$VAR1 -p$VAR2 -e 'select count(*) as columnsCount_umTenant from INFORMATION_SCHEMA.COLUMNS where table_schema = "shared_db" and table_name = "UM_TENANT"' | sed -z 's/\n/,/g;s/,$/\n/' >> /test/validationData.txt
