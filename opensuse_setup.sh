#!/bin/bash

# === Refresh and upgrade system ===
echo "Refreshing zypper and performing dist-upgrade..."
sudo zypper refresh
sudo zypper dup -y

###############
## dev stuff ##
###############

echo "Installing Microsoft repo prerequisites..."
sudo zypper install -y libicu
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

echo "Setting up Microsoft repository..."
wget -q https://packages.microsoft.com/config/opensuse/15/prod.repo
sudo mv prod.repo /etc/zypp/repos.d/microsoft-prod.repo
sudo chown root:root /etc/zypp/repos.d/microsoft-prod.repo
sudo zypper addrepo -f https://packages.microsoft.com/yumrepos/vscode vscode
sudo zypper refresh

echo "Installing .NET SDK and Visual Studio Code..."
sudo zypper install -y dotnet-sdk-9.0 code

echo "Installing Go..."
sudo zypper install -y go

echo "Installing OpenJDK 25..."
sudo zypper install -y java-openjdk-25

echo "Installing Git..."
sudo zypper install -y git

echo "Installing Docker and Docker Compose..."
sudo zypper install -y docker docker-compose docker-compose-switch
sudo systemctl enable --now docker
sudo usermod -aG docker "$USER"
echo "Docker installed. Please log out and log back in for group changes to take effect."

echo "Running Docker test container..."
if docker run --rm hello-world; then
  echo "Docker is working."
else
  echo "Docker test failed. Try rebooting or logging out/in, then run docker run --rm hello-world; again."
fi

echo "Installing Node.js and Angular CLI..."
sudo zypper install -y nodejs
sudo npm install -g @angular/cli

echo "NOTE: Download JetBrains Toolbox manually from:"
echo "https://www.jetbrains.com/toolbox-app/"
echo "After download: chmod +x jetbrains-toolbox && ./jetbrains-toolbox"

echo "Installing VirtualBox..."
sudo zypper install -y virtualbox

#################
## other stuff ##
#################

echo "Installing Discord..."
sudo zypper install -y discord

echo "Installing Zotero..."
sudo zypper addrepo -f https://download.opensuse.org/repositories/home:MasterPatricko/openSUSE_Tumbleweed/home:MasterPatricko.repo
sudo zypper refresh
sudo zypper install -y zotero

echo "Setup complete! Please reboot if Docker or user group changes were made."
