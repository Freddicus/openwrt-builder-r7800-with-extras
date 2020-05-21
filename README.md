# OpenWRT Builder for Netgear R7800 (with extras)

OpenWRT builder for R7800 with add-ons for my personal setup. Docker image prebaked with **US/New_York** timezone. If you need to change the timezone information, adjust the `Dockerfile` where it sets up the quiet tzdata package install.

The following changes have been made from the default:

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

***Don't forget to `docker cp` your builds when you're done!***

## References

Building

* [Quick Build](https://openwrt.org/docs/guide-developer/quickstart-build-images)

Packages

* [Time Machine](https://openwrt.org/docs/guide-user/services/nas/netatalk_configuration)
* [USB storage](https://openwrt.org/docs/guide-user/storage/usb-drives)

Misc

* [Silent tzdata install](https://stackoverflow.com/questions/8671308/non-interactive-method-for-dpkg-reconfigure-tzdata)
