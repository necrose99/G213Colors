#### https://github.com/JeroenED/G213Colors/blob/master/makefile

install :
	cp G213Colors.py /usr/bin/G213Colors.py
	cp main.py /usr/bin/g213colors-gui
	cp default.conf /etc/G213Colors.conf
	cp g213colors.service /etc/systemd/system/g213colors.service
	cp g213colors.openrc /etc/init.d/g213colors
	# fix permisions +x g213colors openrc wont fix perms and enable otherwise. found out the hardway.. 
	chmod +x /etc/init.d/g213colors
	chmod +x /usr/bin/G213Colors.py
	chmod +x /usr/bin/g213colors-gui
	cp icons/G213Colors-16.png /usr/share/icons/hicolor/16x16/apps/g213colors.png
	cp icons/G213Colors-24.png /usr/share/icons/hicolor/24x24/apps/g213colors.png
	cp icons/G213Colors-32.png /usr/share/icons/hicolor/32x32/apps/g213colors.png
	cp icons/G213Colors-48.png /usr/share/icons/hicolor/48x48/apps/g213colors.png
	cp icons/G213Colors-128.png /usr/share/icons/hicolor/128x128/apps/g213colors.png
	cp icons/G213Colors-192.png /usr/share/icons/hicolor/192x192/apps/g213colors.png
	cp G213Colors.desktop /usr/share/applications/g213colors.desktop
	cp be.jeroened.pkexec.g213colors.policy /usr/share/polkit-1/actions/
	gtk-update-icon-cache -q /usr/share/icons/hicolor/
	
install_check 
## call checker splt to debug... 
## https://unix.stackexchange.com/questions/603997/makefile-file-exists-check-not-consistent
# https://unix.stackexchange.com/questions/121654/convenient-way-to-check-if-system-is-using-systemd-or-sysvinit-in-bash

install_check :	 
#### probe /sbin/openrc if exisits add boot/default  runner else.. enable systemd 
	#check: /sbin/openrc
	if ! [ -x "$(command -v /sbin/openrc)" ]; then \
 	rc-update add g213colors default \	
  	elif \
	else systemctl daemon-reload \
        fi
	#check: /usr/lib/systemd/systemd 	
uninstall :
	rm /usr/bin/G213Colors.py
	rm /usr/bin/g213colors-gui
	rm /etc/G213Colors.conf
	rm /etc/systemd/system/g213colors.service
	rm /etc/init.d/g213colors
	rm /usr/share/icons/hicolor/16x16/apps/g213colors.png
	rm /usr/share/icons/hicolor/24x24/apps/g213colors.png
	rm /usr/share/icons/hicolor/32x32/apps/g213colors.png
	rm /usr/share/icons/hicolor/48x48/apps/g213colors.png
	rm /usr/share/icons/hicolor/128x128/apps/g213colors.png
	rm /usr/share/icons/hicolor/192x192/apps/g213colors.png
	rm /usr/share/applications/g213colors.desktop
	rm /usr/share/polkit-1/actions/be.jeroened.pkexec.g213colors.policy
	gtk-update-icon-cache -q /usr/share/icons/hicolor/
	systemctl daemon-reload
