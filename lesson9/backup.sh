#!/bin/bash
# Define database name
DB_NAME="lesson_db"
# Define backup directory
BACKUP_DIR="/opt/mysql_backup"
# Generate timestamp for backup file
TIMESTAMP=$(date +%Y%m%d%H%M%S)
# Backup databases
sudo mysqldump -u root $DB_NAME > $BACKUP_DIR/$DB_NAME-$TIMESTAMP.sql
