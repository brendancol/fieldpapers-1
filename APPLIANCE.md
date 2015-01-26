##Install Field Papers Virtualbox Appliance
=======================

This guide will help you install the Field Papers on your local computer.  The appliance runs fieldpapers (i.e accounts, atlases, scans, uploads).  The host computer still requires an internet connection to access basemap content.

###Download and install:

	- Virtualbox https://www.virtualbox.org/wiki/Downloads
	- s3://blueraster-outbox/fieldpapers-appliance-2.0.4.ova

###Optionally edit your local `hosts` file:

	OSX: $> echo "192.168.33.10 fieldpapers" | sudo tee -a /private/etc/hosts

	Windows 7: PS> Set-HostsEntry -IPAddress 192.168.33.10 -HostName 'fieldpapers' -Description "fieldpapers virtualbox appliance"

		Note: Windows installs may require some additional network configuration:
		    IP address configuration in Windows:

				1. Go to Control Panel -> Network and Sharing Center
				2. Change adapter settings (on the left bar)
				3. Find VirtualBox Host-Only Network
				4. Right click, go to Properties
				5. Highlight Internet Protocol Version 4 (TCP/IPv4)
				6. Click Properties
				7. Select the radio for Use the following IP address:
				8. Address and subnet mask go in the boxes


