.PHONY: db.backup db.restore

db.backup:
	docker-compose exec mariadb bash -c 'mysqldump -u root --password=$$MYSQL_ROOT_PASSWORD  $$MYSQL_DATABASE > /db/$$MYSQL_DATABASE.sql'

db.restore:
	docker-compose exec mariadb bash -c 'mysql -u root -p$$MYSQL_ROOT_PASSWORD $$MYSQL_DATABASE < /db/$$MYSQL_DATABASE.sql'