AnyDesk Addresses
Galois:    663703111
DalaiLama: 158467604
Mason:     783425554
TheServe:  423536255
TheServe (Linux): 545002835


## Copy SSH keys over to new machine
	cp /path/to/my/key/id_rsa ~/.ssh/id_rsa
	cp /path/to/my/key/id_rsa.pub ~/.ssh/id_rsa.pub
	# change permissions on file
	sudo chmod 600 ~/.ssh/id_rsa
	sudo chmod 600 ~/.ssh/id_rsa.pub
	# start the ssh-agent in the background
	eval $(ssh-agent -s)
	# make ssh agent to actually use copied key
	ssh-add ~/.ssh/id_rsa
