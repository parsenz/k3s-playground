#!/bin/bash

curl -sfL https://get.k3s.io | sh -
sudo hostnamectl set-hostname k3s-master
sudo apt-get install -y pkg-config bash-completion
rm -rf ~/.kubectx
git clone https://github.com/ahmetb/kubectx.git ~/.kubectx
COMPDIR=$(pkg-config --variable=completionsdir bash-completion)
sudo ln -sf ~/.kubectx/completion/kubens.bash $COMPDIR/kubens
sudo ln -sf ~/.kubectx/completion/kubectx.bash $COMPDIR/kubectx
cat << EOF >> ~/.bashrc

#kubectx and kubens
export PATH=~/.kubectx:\$PATH
EOF
