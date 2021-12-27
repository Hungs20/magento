### Chạy docker:
```console
docker-compose up -d
```
### Tạo thư mục ecommerce bên trong src

exec vào container phpfpm
```console
cd var/www/html/ecommerce
```
### Tải magento:
```console
composer config -g repo.packagist composer https://packagist.org
composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition .
```

### Chạy lệnh install cho magento:
```console
bin/magento setup:install \
--backend-frontname=admin --db-host=mysql --db-name=ecommerce --db-user=root --db-password=root \
--search-engine=elasticsearch7 --elasticsearch-host=elastic \
--elasticsearch-port=9200
```
### Tạo tài khoản Admin:
```console
bin/magento admin:user:create --admin-user='admin' --admin-password='test123' --admin-email='admin@admin.com' --admin-firstname='Admin' --admin-lastname='Admin'
```

### Nếu bị lỗi do thiếu module Elastisearch:
```console
php bin/magento module:disable {Magento_Elasticsearch,Magento_InventoryElasticsearch,Magento_Elasticsearch6,Magento_Elasticsearch7}
```
### Nếu bị lỗi do Two Factor Auth:
```console
bin/magento module:disable Magento_TwoFactorAuth
```

### Install plugin elasticsearch
exec elastic
```console
cd /usr/share/elasticsearch
bin/elasticsearch-plugin install analysis-phonetic
bin/elasticsearch-plugin install analysis-icu
```
### Fix outdate module
exec mysql
```console
update setup_module set data_version = schema_version where data_version is NULL;
```
### Fix theme
```console
cd /src/ecommerce/tools
yarn styles && yarn babel && yarn svg
```
### Change logo
```console
cp logo.svg src/ecommerce/vendor/snowdog/theme-frontend-alpaca/web/images/icons
```
### Fix proxy error
```console
chmod -R 0777 var/ pub/ generated/
rm -rf var/cache/* var/view_preprocessed/* generated/* pub/static/*
php bin/magento setup:upgrade
php bin/magento setup:di:compile
php bin/magento setup:static-content:deploy -f
php bin/magento cache:flush
php bin/magento indexer:reindex
chmod -R 0777 var/ pub/ generated/
```
### Change ssl
```console
/var/www/html/ecommerce# bin/magento setup:store-config:set --base-url="https://hdhgearshop.tk/" --base-url-secure="https://hdhgearshop.tk/" --use-secure=1 --use-secure-admin=1
```
