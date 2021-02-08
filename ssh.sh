apt-get install ssh
service ssh start
#remove the run levels to enable remote ssh
update-rc.d -f ssh remove
#load ssh defaults
update-rc.d -f ssh defaults
#update kali defaultkeys to avoid MITM attack
#move to current keys to a new folder
cd /etc/ssh/
mkdir default_kali_keys
mv ssh_host_* default_kali_keys
# now I will regenerate the keys
dpkg-reconfigure openssh-server
#just for shits and giggles we can verify tht the SSH key hashes are diffrent
#still in the /etc/shh/ dir
md5sum ssh_host_*
cd default_kali_keys/
md5sum *
#finish it off with a restart to the SSH server


