AnyDesk Addresses
Galois:    663703111
DalaiLama: 158467604
Mason:     783425554
TheServe:  423536255
TheServe (Linux): 545002835
Halicarnassus: 884050063
Pavilion23 (Hazard): 606055001


## Copy SSH keys over to new machine
	cp /path/to/my/key/id_rsa ~/.ssh/id_rsa
	cp /path/to/my/key/id_rsa.pub ~/.ssh/id_rsa.pub
	# change permissions on file
    sudo chmod 755  ~/.ssh/ -R
    sudo chmod 600  ~/.ssh/authorized_keys
    sudo chmod 600 ~/.ssh/id_rsa.pub
    sudo chmod 600 ~/.ssh/id_rsa


	# start the ssh-agent in the background
	eval $(ssh-agent -s)
	# make ssh agent to actually use copied key
	ssh-add ~/.ssh/id_rsa

# Find files by date
    find . -type f -newermt 2017-09-24 -ls -name *.py

