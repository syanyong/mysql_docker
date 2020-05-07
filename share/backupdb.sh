#!/bin/sh
# ./backupdb.sh databasename
DB=$1
WORKDIR=/tmp/mysql
PASSWD=$WORKDIR/.sqlpwd
BACKUPDIR=$WORKDIR
SQLFILE=DB-$DB-$(date '+%Y-%m-%d_%H%M%S').sql
SQLPATH=$WORKDIR/$SQLFILE

echo $DB $SQLPATH
cd $BACKUPDIR
mysqldump --defaults-extra-file=$PASSWD --databases $DB > "$SQLFILE" 
tar czvf $SQLFILE.tar.gz $SQLFILE
rm $SQLFILE


remove_old ()
{
        find $1 -name "*.tar.gz" -mtime $2 -type f -exec rm -f {} \;
        logger Clean old $1 by $2
}

remove_old $BACKUPDIR 12


