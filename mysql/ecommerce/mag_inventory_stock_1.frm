TYPE=VIEW
query=select distinct `legacy_stock_status`.`product_id` AS `product_id`,`legacy_stock_status`.`website_id` AS `website_id`,`legacy_stock_status`.`stock_id` AS `stock_id`,`legacy_stock_status`.`qty` AS `quantity`,`legacy_stock_status`.`stock_status` AS `is_salable`,`product`.`sku` AS `sku` from (`ecommerce`.`mag_cataloginventory_stock_status` `legacy_stock_status` join `ecommerce`.`mag_catalog_product_entity` `product` on((`legacy_stock_status`.`product_id` = `product`.`entity_id`)))
md5=637ba02c8326b03f3847097978a73687
updatable=0
algorithm=0
definer_user=user1
definer_host=localhost
suid=0
with_check_option=0
timestamp=2021-12-23 03:58:12
create-version=1
source=select distinct `legacy_stock_status`.`product_id` AS `product_id`,`legacy_stock_status`.`website_id` AS `website_id`,`legacy_stock_status`.`stock_id` AS `stock_id`,`legacy_stock_status`.`qty` AS `quantity`,`legacy_stock_status`.`stock_status` AS `is_salable`,`product`.`sku` AS `sku` from (`mag_cataloginventory_stock_status` `legacy_stock_status` join `mag_catalog_product_entity` `product` on((`legacy_stock_status`.`product_id` = `product`.`entity_id`)))
client_cs_name=utf8
connection_cl_name=utf8_general_ci
view_body_utf8=select distinct `legacy_stock_status`.`product_id` AS `product_id`,`legacy_stock_status`.`website_id` AS `website_id`,`legacy_stock_status`.`stock_id` AS `stock_id`,`legacy_stock_status`.`qty` AS `quantity`,`legacy_stock_status`.`stock_status` AS `is_salable`,`product`.`sku` AS `sku` from (`ecommerce`.`mag_cataloginventory_stock_status` `legacy_stock_status` join `ecommerce`.`mag_catalog_product_entity` `product` on((`legacy_stock_status`.`product_id` = `product`.`entity_id`)))
