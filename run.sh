echo "Installing Salt and Git..."
sudo apt-get update
sudo apt-get -y install git salt-minion

echo "Retrieving and Applying Settings..."
echo 'master: localhost'|sudo tee /etc/salt/minion
git clone https://github.com/JamiJ/RTMP-phone
cd RTMP-phone
sudo bash highstate.sh

echo "Configuring Desktop"
setxkbmap fi
sudo timedatectl set-timezone Europe/Helsinki
git config --global credential.helper "cache --timeout=3600"
git config --global push.default simple
