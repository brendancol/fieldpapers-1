#!/bin/bash
restore_file=$1
conn="vagrant@192.168.33.10"

read -p "Current field papers database will be overwritten. Continue...? (y/n)? " answer
case ${answer:0:1} in
    y|Y )
        scp $restore_file "${conn}:/tmp/"
        echo 'copy complete...'
        ssh $conn " bash /usr/local/fieldpapers/site/simple_restore.sh /tmp/${restore_file}" 
    ;;
    * )
        echo 'Aborting fieldpapers restore...'
    ;;
esac
