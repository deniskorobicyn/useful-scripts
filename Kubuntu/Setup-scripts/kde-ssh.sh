#!/bin/bash
sudo apt-get install ksshaskpass -y
cat >~/.kde/Autostart/ssh-add.sh <<_EOT_
#!/bin/sh
export SSH_ASKPASS=/usr/bin/ksshaskpass
ssh-add </dev/null
_EOT_
chmod +x ~/.kde/Autostart/ssh-add.sh
~/.kde/Autostart/ssh-add.sh