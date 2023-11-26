INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_admin', 'Admin Job', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_admin', 'Admin Job', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_admin', 'Admin Job', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('admin', 'Admin Job');

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('admin', 0, 'admin','Administrateur', 0,'{}','{}');

INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES (NULL, 'society_admin', '999999999', NULL);