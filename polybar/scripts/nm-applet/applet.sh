#!/bin/sh


ssid() {
	length=$(cat ~/.config/polybar/scripts/nm-applet/curr_ssid | tr -d '\n' | wc -m)
	if [[ $length -lt 1 ]]; then
		if nmcli connection show 2>&1 | grep -iq 'error'; then
			echo `nmcli connection show | sed -n '1!p' | grep -iv '\--' | awk '{print $1}' | head -1` > ~/.config/polybar/scripts/nm-applet/curr_ssid
		else
			echo '' > ~/.config/polybar/scripts/nm-applet/curr_ssid
		fi
	else
		echo '' > ~/.config/polybar/scripts/nm-applet/curr_ssid
	fi
}

vpn() {
	if [[ `nmcli connection show | grep -i UGent-Home | egrep "enp4s0|wlp3s0"` ]]; then
		nmcli connection down "UGent-Home"
	else
		nmcli connection up "UGent-Home"
	fi
}

icon() {
	if [[ `nmcli -f ACTIVE 2>&1 | grep 'connected to' | sed 's/.*connected to //g' | wc -l` -eq 0 ]]; then
		echo ""
	elif [[ `nmcli connection show 2>&1 | grep 'tun0'` ]]; then
		echo "" `cat ~/.config/polybar/scripts/nm-applet/curr_ssid` `vnstat | grep -A 4 tun0 | grep today | cut -d'/' -f3`
	else
		echo "" `cat ~/.config/polybar/scripts/nm-applet/curr_ssid`

	fi
}


case $1 in
	--ssid)
		ssid
		;;
	--vpn)
		vpn
		;;
	*)
		icon
		;;
esac


