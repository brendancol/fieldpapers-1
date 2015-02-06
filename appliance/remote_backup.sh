#!/bin/bash
conn="vagrant@192.168.33.10" 
backup=`ssh $conn "bash /usr/local/fieldpapers/site/simple_backup.sh | grep tar.gz"`
scp "$conn:${backup}" ./
