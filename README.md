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

## Build Docker Container & Run

To build the container run the following command:

```docker build -t openwrt/builder-r7800-us-ny:latest --no-cache .```

To run the container:

```docker run -it openwrt/builder-r7800-us-ny:latest```

## Building OpenWRT

Run `make menuconfig` to run further configuration.

Run `make` to build image.

Run `make -j5 download world` to run make with five jobs / threads.

Run `make -j1 V=sc` if you run into problems.

## Finishing up

Don't forget to retrieve your builds when the build is done or they will be lost. Use `docker ps` to discover the docker container hash. Then use `docker cp` to copy the builds locally.

Example:

```docker cp -a <docker_container_hash>:/openwrt/bin ./bin/```

### References

Building

* [Quick Build](https://openwrt.org/docs/guide-developer/quickstart-build-images)

Packages

* [Time Machine](https://openwrt.org/docs/guide-user/services/nas/netatalk_configuration)
* [USB storage](https://openwrt.org/docs/guide-user/storage/usb-drives)

Misc

* [Silent tzdata install](https://stackoverflow.com/questions/8671308/non-interactive-method-for-dpkg-reconfigure-tzdata)
