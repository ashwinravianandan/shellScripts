#!/bin/sh
export DISPLAY=:0.0
export XAUTHORITY=/home/ashwin/.Xauthority
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
if [ -f /sys/class/drm/card1-HDMI-A-1/status ]; then
	STATUS=$(cat /sys/class/drm/card1-HDMI-A-1/status)
	if [ $STATUS = connected ] ; then
		ln -sf /home/ashwin/.HDMIAlsaConfig /home/ashwin/.asoundrc 
		/usr/bin/xrandr --output HDMI1 --mode 1920x1080
	else
		ln -sf /home/ashwin/.builtInAlsaConfig /home/ashwin/.asoundrc 
	fi
elif [ -f /sys/class/drm/card0-HDMI-A-1/status ]; then
	STATUS=$(cat /sys/class/drm/card0-HDMI-A-1/status)
	if [ $STATUS = connected ] ; then
		ln -sf /home/ashwin/.HDMIAlsaConfig /home/ashwin/.asoundrc 
		/usr/bin/xrandr --output HDMI1 --mode 1920x1080
	else
		ln -sf /home/ashwin/.builtInAlsaConfig /home/ashwin/.asoundrc 
	fi
else
	ln -sf /home/ashwin/.builtInAlsaConfig /home/ashwin/.asoundrc 
fi


/etc/rc.d/rc.alsa force_reload
# kill and start mpd only if an instance is running
if [ -f /home/ashwin/.mpd/pid ]; then
	kill $(cat /home/ashwin/.mpd/pid)
	sleep 3
	sudo  -u ashwin /usr/local/bin/mpd /home/ashwin/.mpdconf 2> /tmp/AlsaRestart.log
fi
