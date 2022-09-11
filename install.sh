#!/bin/bash
result=$(grep dwc2 /boot/config.txt)
if [ -z $result ] ; then
    echo "dtoverlay=dwc2" | sudo tee -a /boot/config.txt
fi

result=$(grep dwc2 /etc/modules)
if [ -z $result ] ; then
    echo "dwc2" | sudo tee -a /etc/modules
fi

result=$(grep libcomposite /etc/modules)
if [ -z $result ] ; then
    echo "libcomposite" | sudo tee -a /etc/modules
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd ${DIR}/hid
./setup.sh