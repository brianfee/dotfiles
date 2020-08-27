#!/usr/bin/sh

if [ $(pgrep -x openvpn) ]
then
	$(sudo systemctl stop openvpn-client@client)
else
	$(sudo systemctl restart openvpn-client@client)
fi

sleep 5
echo `curl -s icanhazip.com`
