** Chạy docker:
- docker-compose up -d

** Tạo thư mục ecommerce bên trong src

** exec vào container phpfpm

** cd vào var/www/html/ecommerce

** Tải magento:

- composer config -g repo.packagist composer https://packagist.org
- composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition .

** Setup connect đến mysql:

- bin/magento setup:config:set --backend-frontname=admin --db-host=mysql --db-name=ecommerce --db-user=root --db-password=root

** Chạy lệnh install cho magento:

- bin/magento setup:install \
--search-engine=elasticsearch7 --elasticsearch-host=elastic \
--elasticsearch-port=9200

** Tạo tài khoản Admin:

- $ bin/magento admin:user:create --admin-user='admin' --admin-password='test123' --admin-email='admin@admin.com' --admin-firstname='Admin' --admin-lastname='Admin'


** Nếu bị lỗi do thiếu module Elastisearch:

- php bin/magento module:disable {Magento_Elasticsearch,Magento_InventoryElasticsearch,Magento_Elasticsearch6,Magento_Elasticsearch7}

** Nếu bị lỗi do Two Factor Auth:

- bin/magento module:disable Magento_TwoFactorAuth

** Nếu bị memory_limit: 

- cd vào /usr/local/etc/php/conf.d
- tạo file memory_limit.ini
- lưu vào file trên: memory_limit = -1

