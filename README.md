# OpenWRT Builder Docker Image (pre-configured)
OpenWRT builder for R7800 with add-ons for my personal setup. Docker imagine prebaked with **US/East timezone** and the following:
* LuCi with material theme
  * luci
  * luci-theme-material
* USB drive support
  * kmod-usb-storage
  * kmod-usb-storage-uas
  * usbutils
* WPA3 support
  * Remove wpad-basic
  * Add wpad-openssl
* Time Machine support
  * avahi-utils
  * netatalk
