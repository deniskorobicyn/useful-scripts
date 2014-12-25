#!/bin/bash

set -e

function cleanup {
  echo "Cleanup.."
  rm -rf /tmp/pam-kwallet
}
trap cleanup EXIT

sudo apt-get update
sudo apt-get install ksshaskpass build-essential libpam-dev libgcrypt-dev cmake git -y

#TODO add checks on kde or kde4

# Make startup scripts for ssh
 cat >~/.kde/Autostart/ssh-add.sh <<EOT
#!/bin/sh
export SSH_ASKPASS=/usr/bin/ksshaskpass
ssh-add </dev/null
EOT
# Because eval is stuipid we dio it in stuipid way
if [ ! -d ~/.kde/env ]; then
  mkdir ~/.kde/env
fi
if [ -f ~/.kde/env/ssh-add.sh ]; then
	rm ~/.kde/env/ssh-add.sh
fi
touch ~/.kde/env/ssh-add.sh
echo "#!/bin/bash" >> ~/.kde/env/ssh-add.sh
echo 'eval "$(ssh-agent -s)"' >> ~/.kde/env/ssh-add.sh
chmod +x ~/.kde/env/ssh-add.sh


if [ ! -d ~/.kde/shutdown ]; then
  mkdir ~/.kde/shutdown
fi
cat >~/.kde/shutdown/ssh-shutdown.sh <<EOT
#!/bin/sh
ssh-agent -k
EOT
chmod +x ~/.kde/shutdown/ssh-shutdown.sh


# Download and build pam-kwallet
if [ -d pam-kwallet ]; then
  rm -rf pam-kwallet
fi
git clone git://anongit.kde.org/scratch/afiestas/pam-kwallet.git /tmp/pam-kwallet
cd /tmp/pam-kwallet
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix) ../
make
sudo make install


# Fix sturtup kdm config

echo "Fixing /etc/pam.d/kdm...."
check_auth=$(grep -n '^auth optional pam_kwallet.so' /etc/pam.d/kdm | tail -1 | cut -d: -f1)
if [ -z "$check_auth" ]; then
	insert_line=$(grep -n '^@include common-auth' /etc/pam.d/kdm | tail -1 | cut -d: -f1)
	if [ ! -z "$insert_line" ]; then
	sudo sed -i "$insert_line aauth optional pam_kwallet.so " /etc/pam.d/kdm 
	else
		# not tested
		insert_line=$(grep -n '^auth ' /etc/pam.d/kdm | tail -1 | cut -d: -f1)
		if [ ! -z "$insert_line" ]; then
			sudo sed -i "$insert_line aauth optional pam_kwallet.so" /etc/pam.d/kdm
		else
			echo "auth: error: failed to find proper line to insert - \"auth optional pam_kwallet.so\"!"
		fi
	fi
else
	echo "auth: already exists!"
fi

check_session=$(grep -n '^session optional pam_kwallet.so auto_start' /etc/pam.d/kdm | tail -1 | cut -d: -f1)
if [ -z "$check_session" ]; then
	insert_line=$(grep -n '^@include common-session' /etc/pam.d/kdm | tail -1 | cut -d: -f1)
	if [ ! -z "$insert_line" ]; then
		sudo sed -i "$insert_line asession optional pam_kwallet.so auto_start " /etc/pam.d/kdm 
	else
		# not tested
		insert_line=$(grep -n '^session ' /etc/pam.d/kdm | tail -1 | cut -d: -f1)
		if [ ! -z "$insert_line" ]; then
			sudo sed -i "$insert_line asession optional pam_kwallet.so auto_start" /etc/pam.d/kdm
		else
			echo "session: error: failed to find proper line to insert - \"session optional pam_kwallet.so auto_start\"!"
		fi
	fi
else
	echo "session: already exists!"
fi
