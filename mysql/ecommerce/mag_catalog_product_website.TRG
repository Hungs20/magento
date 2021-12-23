TYPE=TRIGGERS
triggers='CREATE DEFINER=`user1`@`localhost` TRIGGER trg_mag_catalog_product_website_after_insert AFTER INSERT ON mag_catalog_product_website FOR EACH ROW\nBEGIN\nINSERT IGNORE INTO `mag_scconnector_google_remove_cl` (`entity_id`) VALUES (NEW.`product_id`);\nEND' 'CREATE DEFINER=`user1`@`localhost` TRIGGER trg_mag_catalog_product_website_after_update AFTER UPDATE ON mag_catalog_product_website FOR EACH ROW\nBEGIN\nIF (NOT(NEW.`product_id` <=> OLD.`product_id`) OR NOT(NEW.`website_id` <=> OLD.`website_id`)) THEN INSERT IGNORE INTO `mag_scconnector_google_remove_cl` (`entity_id`) VALUES (NEW.`product_id`); END IF;\nEND' 'CREATE DEFINER=`user1`@`localhost` TRIGGER trg_mag_catalog_product_website_after_delete AFTER DELETE ON mag_catalog_product_website FOR EACH ROW\nBEGIN\nINSERT IGNORE INTO `mag_scconnector_google_remove_cl` (`entity_id`) VALUES (OLD.`product_id`);\nEND'
sql_modes=0 0 0
definers='user1@localhost' 'user1@localhost' 'user1@localhost'
client_cs_names='utf8' 'utf8' 'utf8'
connection_cl_names='utf8_general_ci' 'utf8_general_ci' 'utf8_general_ci'
db_cl_names='latin1_swedish_ci' 'latin1_swedish_ci' 'latin1_swedish_ci'
created=164023151994 164023151997 164023152001
