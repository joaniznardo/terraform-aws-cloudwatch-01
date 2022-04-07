#!/bin/bash
sudo apt-get update
apt-get install -y stress-ng
curl https://my-netdata.io/kickstart.sh > /tmp/netdata-kickstart.sh && sh /tmp/netdata-kickstart.sh --non-interactive
sed -i '/bind/ s/localhost/0\.0\.0\.0/' /etc/netdata/netdata.conf
systemctl restart netdata
stress-ng --cpu 2 --matrix 1 --mq 3 -t 2m
