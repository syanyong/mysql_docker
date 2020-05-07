#!/bin/sh

if [ -z "$1" ] && [ -z "$2" ]
then
    echo "Argument errror example ./dockerVRestore.sh backup.tar.gz volume_name"
    exit
fi

echo $1 $2
read -p 'Confirm? ' is_confirmed
if [ $is_confirmed == "y" ]; then
    cat $1 | docker run -i -v $2:/volume --rm loomchild/volume-backup restore -
fi




