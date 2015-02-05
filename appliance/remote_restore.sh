#!/bin/bash
restore_file=$1
user=vagrant
host=192.168.33.10
conn="${user}@${host}"
remote_dir=/usr/local/fieldpapers/site/

read -p "Current field papers database will be overwritten. Continue...? (y/n)? " answer
case ${answer:0:1} in
    y|Y )
        scp $restore_file "${conn}:${remote_dir}"
        ssh $conn "bash ${remote_dir}/simple_restore.sh ${restore_file}" 
    ;;
    * )
        echo 'Aborting fieldpapers restore...'
    ;;
esac
