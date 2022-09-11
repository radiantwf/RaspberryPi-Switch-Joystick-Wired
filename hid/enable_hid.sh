#!/bin/bash
cd /sys/kernel/config/usb_gadget/
mkdir -p procon
cd procon
echo 0x0f0d > idVendor
echo 0x00c1 > idProduct
echo 0x0572 > bcdDevice
echo 0x0200 > bcdUSB
echo 0x00 > bDeviceClass
echo 0x00 > bDeviceSubClass
echo 0x00 > bDeviceProtocol

mkdir -p strings/0x409
echo "" > strings/0x409/serialnumber
echo "HORI CO.,LTD." > strings/0x409/manufacturer
echo "HORIPAD S" > strings/0x409/product

mkdir -p configs/c.1/strings/0x409
echo "HORI Controller" > configs/c.1/strings/0x409/configuration
echo 500 > configs/c.1/MaxPower
echo 0x80 > configs/c.1/bmAttributes

mkdir -p functions/hid.usb0
echo 1 > functions/hid.usb0/protocol
echo 0 > functions/hid.usb0/subclass
echo 64 > functions/hid.usb0/report_length
echo -ne \\x5\\x1\\x9\\x5\\xa1\\x1\\x15\\x0\\x25\\x1\\x35\\x0\\x45\\x1\\x75\\x1\\x95\\xe\\x5\\x9\\x19\\x1\\x29\\xb\\x81\\x2\\x95\\x2\\x81\\x1\\x5\\x1\\x25\\x7\\x46\\x3b\\x1\\x75\\x4\\x95\\x1\\x65\\x14\\x9\\x39\\x81\\x42\\x65\\x0\\x95\\x1\\x81\\x1\\x26\\xff\\x0\\x46\\xff\\x0\\x9\\x30\\x9\\x31\\x9\\x32\\x9\\x35\\x75\\x8\\x95\\x4\\x81\\x2\\x75\\x8\\x95\\x1\\x81\\x1\\xc0 > functions/hid.usb0/report_desc

mkdir -p functions/uac1.0
ln -s functions/hid.usb0 configs/c.1/
ln -s functions/uac1.0 configs/c.1/

udevadm settle -t 5 || :
ls /sys/class/udc > UDC

chmod 0666 /dev/hidg0