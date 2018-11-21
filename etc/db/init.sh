#!/bin/bash
if [ -f /db/$MYSQL_DATABASE.sql ]; then
  mysql --protocol=socket -uroot -p -p"$MYSQL_ROOT_PASSWORD" $MYSQL_DATABASE < /db/$MYSQL_DATABASE.sql
fi