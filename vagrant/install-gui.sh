#!/bin/bash -x

# Install Lubutntu
apt-get update
apt-get install -y --no-install-recommends lubuntu-desktop
sed -i "s/allowed_users=.*$/allowed_users=anybody/" /etc/X11/Xwrapper.config

# Install VirtualBox Guest Additions
apt-get install -y virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
VBoxClient --clipboard
VBoxClient --draganddrop
VBoxClient --display
VBoxClient --checkhostversion
VBoxClient --seamless

# apt install -y snapd

# Create utnso dirs
mkdir -p /home/utnso/.local/share/applications
mkdir -p /home/utnso/Desktop/

get_package() # Params: link, src, dest
{
    wget -O "$2.tar.gz" -q "$1"
    tar -zxvf "$2.tar.gz"
    mv -f "$2" "$3"
}

create_desktop_entry() # Params: command, name, exec, icon, version
{
    sudo ln -s "$3" "/usr/local/bin/$1"

    { 
        echo "[Desktop Entry]"
        echo "Name=$2"
        echo "Type=Application"
        echo "Exec=$3"
        echo "Terminal=false"
        echo "Icon=$4"
        echo "Comment=Integrated Development Environment"
        echo "NoDisplay=false"
        echo "Categories=Development;IDE;"
        echo "Version=$5"
    } > "/home/utnso/.local/share/applications/$1.desktop"

    cp "/home/utnso/.local/share/applications/$1.desktop" "/home/utnso/Desktop/"
}

# Install Eclipse IDE
get_package "https://eclipse.c3sl.ufpr.br/technology/epp/downloads/release/2021-03/R/eclipse-cpp-2021-03-R-linux-gtk-x86_64.tar.gz" "eclipse" "/opt/eclipse"
create_desktop_entry "eclipse" "Eclipse IDE" "/opt/eclipse/eclipse" "/opt/eclipse/icon.xpm" "2021-03"

# Install Visual Studio Code
get_package "https://update.code.visualstudio.com/1.55.2/linux-x64/stable" "VSCode-linux-x64" "/opt/vscode"
create_desktop_entry "code" "Visual Studio Code" "/opt/vscode/code" "/opt/vscode/resources/app/resources/linux/code.png" "1.55.2"

# code --no-sandbox --install-extension ms-vscode.cpptools cpptools-linux.vsix
# code --no-sandbox --install-extension MS-vsliveshare.vsliveshare
# code --no-sandbox --install-extension ms-vscode.makefile-tools

# Install CLion
get_package "https://download.jetbrains.com/cpp/CLion-2021.1.tar.gz" "clion-2021.1" "/opt/clion"
create_desktop_entry "clion" "CLion" "/opt/clion/bin/clion.sh" "/opt/clion/bin/clion.svg" "2021.1"

# Utils
apt-get install -y terminator chromium-browser bless xclip