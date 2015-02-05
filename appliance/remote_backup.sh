#!/bin/bash
user=vagrant
host=192.168.33.10
remote_dir=/usr/local/fieldpapers/site/
conn="${user}@${host}"
backup=`ssh $conn "bash ${remote_dir}/simple_backup.sh | grep tar.gz"`
scp "$conn:${backup}" ./
