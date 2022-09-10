#!/bin/bash
# # Enable dwc2 on the Pi
# echo "dtoverlay=dwc2" | sudo tee -a /boot/config.txt

# # Enable dwc2 initialisation
# echo "dwc2" | sudo tee -a /etc/modules

# Install service
sudo cp enable_hid.service /lib/systemd/system/

# Install script
sudo cp enable_hid.sh /usr/bin/
sudo chmod +x /usr/bin/enable_hid.sh

# Enable service
sudo systemctl enable enable_hid.service
