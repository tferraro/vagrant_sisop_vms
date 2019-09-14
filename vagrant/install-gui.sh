#!/bin/bash -x

# Install Lubutntu
apt-get install -y lubuntu-desktop
sed -i "s/allowed_users=.*$/allowed_users=anybody/" /etc/X11/Xwrapper.config

# Install VirtualBox Guest Additions
apt-get install -y virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
VBoxClient --clipboard
VBoxClient --draganddrop
VBoxClient --display
VBoxClient --checkhostversion
VBoxClient --seamless

# Install Eclipse IDE
wget -q http://espejito.fder.edu.uy/eclipse/technology/epp/downloads/release/2019-03/R/eclipse-cpp-2019-03-R-linux-gtk-x86_64.tar.gz
tar -zxvf eclipse-cpp-2019-03-R-linux-gtk-x86_64.tar.gz
mv -f eclipse /opt

mkdir -p /home/utnso/.local/share/applications
echo "[Desktop Entry]" > /home/utnso/.local/share/applications/eclipse.desktop
echo "Name=Eclipse" >> /home/utnso/.local/share/applications/eclipse.desktop
echo "Type=Application" >> /home/utnso/.local/share/applications/eclipse.desktop
echo "Exec=/opt/eclipse/eclipse" >> /home/utnso/.local/share/applications/eclipse.desktop
echo "Terminal=false" >> /home/utnso/.local/share/applications/eclipse.desktop
echo "Icon=/opt/eclipse/icon.xpm" >> /home/utnso/.local/share/applications/eclipse.desktop
echo "Comment=Integrated Development Environment" >> /home/utnso/.local/share/applications/eclipse.desktop
echo "NoDisplay=false" >> /home/utnso/.local/share/applications/eclipse.desktop
echo "Categories=Development;IDE;" >> /home/utnso/.local/share/applications/eclipse.desktop

mkdir -p /home/utnso/Desktop/
cp /home/utnso/.local/share/applications/eclipse.desktop /home/utnso/Desktop/

# Install VS Code
apt install -y snapd
snap install code --classic

cp /var/lib/snapd/desktop/applications/code_code.desktop /home/utnso/Desktop/
# echo "[Desktop Entry]" > /home/utnso/.local/share/applications/vscode.desktop
# echo "Name=Virtual Studio Code" >> /home/utnso/.local/share/applications/vscode.desktop
# echo "Type=Application" >> /home/utnso/.local/share/applications/vscode.desktop
# echo "Exec=??????" >> /home/utnso/.local/share/applications/vscode.desktop
# echo "Terminal=false" >> /home/utnso/.local/share/applications/vscode.desktop
# echo "Icon=??????" >> /home/utnso/.local/share/applications/vscode.desktop
# echo "Comment=Integrated Development Environment" >> /home/utnso/.local/share/applications/vscode.desktop
# echo "NoDisplay=false" >> /home/utnso/.local/share/applications/vscode.desktop
# echo "Categories=Development;IDE;" >> /home/utnso/.local/share/applications/vscode.desktop

# Utils
apt-get install -y aptitude gcc gdb git vim libncurses5 valgrind tig make autotools-dev strace emacs nano openjdk-8-jdk libcunit1 libevent1-dev ssh libfuse-dev build-essential g++ libcunit1-dev curl htop tree wget libreadline7 libreadline-dev docker docker-compose terminator chromium-browser bless xclip
