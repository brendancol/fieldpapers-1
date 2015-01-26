##Installing Field Papers Virtualbox Appliance
---

This guide will help you install Field Papers on your local computer.  The appliance runs fieldpapers accounts, atlases, and uploads independant of fieldpapers.org.  The host computer still requires an internet connection to access basemap content.

###Prerequisites

Download and install appropriate version of [Virtualbox](https://www.virtualbox.org/wiki/Downloads) for your host computer.

Download the [Field Papers Appliance .ova file](http://blueraster-outbox.s3.amazonaws.com/fieldpapers-appliance-2.0.4.ova) (md5=a354c1d517192caeb9e9205b67d84ba5)

Verify appliance MD5 checksum: 
	
	OSX:
	$> md5 fieldpapers-appliance-2.0.4.ova

	Windows Powershell 4:
	PS> Get-FileHash fieldpapers-appliance-2.0.4.ova -Algorithm MD5


###Import appliance into Virtualbox

1. Open Virtualbox program
2. Navigate to `File > Import Appliance...`
3. Browse to downloaded .ova file
4. Review `System Requirements` and `click Import`

###Notes:
Windows installs may require some additional network configuration:
IP address configuration in Windows:

	1. Go to Control Panel -> Network and Sharing Center
	2. Change adapter settings (on the left bar)
	3. Find VirtualBox Host-Only Network
	4. Right click, go to Properties
	5. Highlight Internet Protocol Version 4 (TCP/IPv4)
	6. Click Properties
	7. Select the radio for Use the following IP address:
	8. Address and subnet mask go in the boxes

####Optionally edit your local `hosts` file:

	OSX: $> echo "192.168.33.10 fieldpapers" | sudo tee -a /private/etc/hosts

	Windows 7: PS> Set-HostsEntry -IPAddress 192.168.33.10 -HostName 'fieldpapers' -Description "fieldpapers virtualbox appliance"

		


