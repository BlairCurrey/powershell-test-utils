These are utilities I wrote that automate a few repetitive tasks I ran into
while testing on remote machines in a windows environment.

To start, list the machines you are testing into machines.txt in the following
format:

SOMENAME.SUBDOMAIN1.DOMAIN.COM
SOMEOTHERNAME.SUBDOMAIN2.DOMAIN.COM
etc.

Run batch-rdp-login to open a remote desktop session with all machines 
definined in machines.txt.

Run batch-script-start to start the defined script (currently generic) on each
machine defined in machines.txt. This script assumes the script directory is in 
Downloads folder. Note that this process will run in the background. To verify 
that it's running refer to the return code in the powershell console before 
pressing 'Enter' to exit.

config.txt contains the username and password for two domains and can
be changed in the event that credentials change. They are not stored securely
which is OK for my test environment but shouldn't be used otherwise.