echo "INIT: ejecutando schema.sql"
sqlplus -s myuser/mypassword@//localhost/XE @/opt/oracle/seed/schema.sql
echo "INIT: ejecutando values.sql"
sqlplus -s myuser/mypassword@//localhost/XE @/opt/oracle/seed/values.sql
echo "INIT: finalizado"