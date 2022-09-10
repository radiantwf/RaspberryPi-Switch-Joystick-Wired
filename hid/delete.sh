#!/bin/bash
sudo systemctl disable enable_hid.service
sudo rm -f /usr/bin/enable_hid.sh
sudo rm -f /lib/systemd/system/enable_hid.service


