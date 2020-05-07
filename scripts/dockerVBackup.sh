#!/bin/sh
# This is the script to backup the volume
# The volume name can be checked by docker volumn ls
# example 
# ./dockerVBackup sylox-db_mysqldb backupfile.tar.gz
if [ -z "$1" ] && [ -z "$2" ]
then
    echo "Argument errror example ./dockerVBackup.sh volume_name backupfile.tar.gz"
    exit
fi

VOL=$1
ARCHIVE=$2

echo $1, $2

docker run -v $VOL:/volume --rm loomchild/volume-backup backup - > $ARCHIVE

