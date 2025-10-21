# refresh and update
sudo zypper refresh && sudo zypper dup

# Setup Microsoft stuff (dotnet, vscode)
sudo zypper install libicu
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
wget https://packages.microsoft.com/config/opensuse/15/prod.repo
sudo mv prod.repo /etc/zypp/repos.d/microsoft-prod.repo
sudo chown root:root /etc/zypp/repos.d/microsoft-prod.repo
sudo zypper addrepo https://packages.microsoft.com/yumrepos/vscode vscode
sudo zypper refresh

# Install dotnet-sdk and vs code
sudo zypper install dotnet-sdk-9.0
sudo zypper install code

# Install go programming language
sudo zypper install go

# Install Java Development Kit
sudo zypper install java-openjdk-25

# Install git
sudo zypper install git

# Install and setup docker
zypper install docker docker-compose docker-compose-switch
sudo systemctl enable docker
sudo usermod -G docker -a $USER
newgrp docker
sudo systemctl restart docker
docker run --rm hello-world
docker images
docker rmi -f IMAGE_ID

# Install Spotify Client: flathub

# Install Discord
sudo zypper install discord

# Install node, angular
sudo zypper install nodejs
sudo npm install -g @angular/cli

# jetbrains: download jetbrains-toolbox from https://www.jetbrains.com/toolbox-app/
# extract files, enter directory, execute ./jetbrains-toolbox
# if this fails, chmod 755 jetbrains-toolbox

# Install zotero
sudo zypper addrepo https://download.opensuse.org/repositories/home:MasterPatricko/openSUSE_Tumbleweed/home:MasterPatricko.repo
sudo zypper refresh
sudo zypper install zotero
