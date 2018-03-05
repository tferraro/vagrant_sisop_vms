# Ubuntu Language change
echo 'Configuring Locale to es_AR'
locale-gen --purge 'es_AR.UTF-8'
dpkg-reconfigure --frontend=noninteractive locales
update-locale LC_ALL=es_AR.UTF-8 LANG=es_AR.UTF-8
# Keyboard set to latin-american espanish
sed -i 's/XKBLAYOUT=\"\w*"/XKBLAYOUT=es/g' /etc/default/keyboard
setupcon -v