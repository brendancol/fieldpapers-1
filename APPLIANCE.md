##Installing Field Papers Virtualbox Appliance

This guide will help you install Field Papers on your local computer.  The appliance runs fieldpapers accounts, atlases, and uploads independant of fieldpapers.org.  The host computer still requires an internet connection to access basemap content.

####Prerequisites

1. Download and install appropriate version of [Virtualbox](https://www.virtualbox.org/wiki/Downloads) for your host computer.
2. Download the [Field Papers Appliance .ova file](http://blueraster-outbox.s3.amazonaws.com/fieldpapers-appliance-2.0.5.ova#md5=70c6b5b0c7c70a7c7ee6763354876018)
3. Verify appliance MD5 checksum: 

```bash		
MD5 checksum: 
70c6b5b0c7c70a7c7ee6763354876018
	
OSX:
$> md5 fieldpapers-appliance-2.0.5.ova

Windows Powershell 4:
PS> Get-FileHash fieldpapers-appliance-2.0.5.ova -Algorithm MD5
```

####Import and start appliance 

1. Open Virtualbox program
2. Navigate to `File` > `Import Appliance...`
3. Browse to downloaded .ova file
4. Review `System Requirements` and click `Import`
5. Select imported appliance in virtual machine list and `Start`
6. Edit system `hosts` file

```bash
OSX: 
$> echo "192.168.33.10 fieldpapers" | sudo tee -a /private/etc/hosts

Windows Powershell 4: 
PS> Set-HostsEntry -IPAddress 192.168.33.10 -HostName 'fieldpapers' -Description "fieldpapers virtualbox appliance"

7. Open browser of choice and enter [http://fieldpapers/](http://fieldpapers/)
```

#####Notes:

Windows installs may require some additional network configuration:
IP address configuration in Windows:

1. Go to `Control Panel` -> `Network and Sharing Center`
2. Change adapter settings (on the left bar)
3. Find VirtualBox `Host-Only Network`
4. Right click, go to `Properties`
5. Highlight Internet Protocol Version 4 (TCP/IPv4)
6. Click `Properties`
7. Select the radio for "Use the following IP address: " `192.168.33.10`
8. Enter Address `192.168.33.2` and subnet mask `255.255.255.0` in the boxes
	

####Backup / Restore

1. Download [remote backup script](http://blueraster-fieldpapers.s3.amazonaws.com/simple_backup.sh) and  [remote restore script](http://blueraster-fieldpapers.s3.amazonaws.com/simple_restore.sh).  These scripts talk to the field papers appliance, and should be executed from a command line interface.
1a. Additional Windows Install [Git for Windows](http://git-scm.com/download/win)
2. Open terminal or Git Bash for Windows
3. Run backup (note password: vagrant):

```bash
$> bash remote_backup.sh

    vagrant@192.168.33.10's password: 
    vagrant@192.168.33.10's password: 
    fieldpapers-backup-2015-02-06.tar.gz 100%   12MB  11.6MB/s   00:01 
```

3. Run restore
```bash
$> bash remote_restore.sh fieldpapers-backup-2015-02-06.tar.gz

	Current field papers database will be overwritten. Continue...? (y/n)? y
	vagrant@192.168.33.10's password: 
	fieldpapers-backup-2015-02-06.tar.gz   100%   12MB  11.6MB/s   00:01    
	copy complete...
	vagrant@192.168.33.10's password: 
	Restoring fieldpapers database and files directory
	fieldpapers-backup-2015-02-06/
	fieldpapers-backup-2015-02-06/files/
	fieldpapers-backup-2015-02-06/files/mbtiles/
	fieldpapers-backup-2015-02-06/files/mbtiles/GeoEnabling_Malawi.mbtiles
	fieldpapers-backup-2015-02-06/files/mbtiles/malawi_bc_test_1.mbtiles
	fieldpapers-backup-2015-02-06/files/prints/
	fieldpapers-backup-2015-02-06/files/prints/m72r8m3h/
	fieldpapers-backup-2015-02-06/files/prints/m72r8m3h/field-paper-m72r8m3h.pdf
	fieldpapers-backup-2015-02-06/files/prints/m72r8m3h/preview-pA2.jpg
	fieldpapers-backup-2015-02-06/files/prints/m72r8m3h/preview-pA1.jpg
	fieldpapers-backup-2015-02-06/files/prints/m72r8m3h/preview.jpg
	fieldpapers-backup-2015-02-06/files/prints/m72r8m3h/preview-pi.jpg
	fieldpapers-backup-2015-02-06/files/prints/h7tsd836/
	fieldpapers-backup-2015-02-06/files/prints/h7tsd836/preview-pA2.jpg
	fieldpapers-backup-2015-02-06/files/prints/h7tsd836/field-paper-h7tsd836.pdf
	fieldpapers-backup-2015-02-06/files/prints/h7tsd836/preview-pA1.jpg
	fieldpapers-backup-2015-02-06/files/prints/h7tsd836/preview.jpg
	fieldpapers-backup-2015-02-06/files/prints/h7tsd836/preview-pi.jpg
	fieldpapers-backup-2015-02-06/files/prints/zpn4cvpm/
	fieldpapers-backup-2015-02-06/files/prints/zpn4cvpm/preview-pA2.jpg
	fieldpapers-backup-2015-02-06/files/prints/zpn4cvpm/preview-pA1.jpg
	fieldpapers-backup-2015-02-06/files/prints/zpn4cvpm/preview.jpg
	fieldpapers-backup-2015-02-06/files/prints/zpn4cvpm/field-paper-zpn4cvpm.pdf
	fieldpapers-backup-2015-02-06/files/prints/zpn4cvpm/preview-pi.jpg
	fieldpapers-backup-2015-02-06/files/prints/pc5s5q2b/
	fieldpapers-backup-2015-02-06/files/prints/pc5s5q2b/preview-pA2.jpg
	fieldpapers-backup-2015-02-06/files/prints/pc5s5q2b/preview-pA1.jpg
	fieldpapers-backup-2015-02-06/files/prints/pc5s5q2b/preview.jpg
	fieldpapers-backup-2015-02-06/files/prints/pc5s5q2b/preview-pi.jpg
	fieldpapers-backup-2015-02-06/files/prints/pc5s5q2b/field-paper-pc5s5q2b.pdf
	fieldpapers-backup-2015-02-06/files/scans/
	fieldpapers-backup-2015-02-06/fieldpapers_db.sql
	restoring database...
	restore files...
```