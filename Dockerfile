FROM debian:latest

RUN apt-get update
RUN apt-get install -y build-essential libncursesw5-dev python unzip

## for apt to be noninteractive
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true
ENV FORCE_UNSAFE_CONFIGURE 1

## preesed tzdata, update package index, upgrade packages and install needed software
RUN echo "tzdata tzdata/Areas select US" > /tmp/preseed.txt; \
    echo "tzdata tzdata/Zones/US select New_York" >> /tmp/preseed.txt; \
    debconf-set-selections /tmp/preseed.txt && \
    # rm /etc/timezone && \
    # rm /etc/localtime && \
    apt-get update && \
    apt-get install -y tzdata

RUN apt-get install -y subversion g++ zlib1g-dev build-essential git python python3 python3-distutils libncurses5-dev gawk gettext unzip file libssl-dev wget libelf-dev ecj fastjar java-propose-classpath rsync

RUN umask 0022

RUN git clone https://git.openwrt.org/openwrt/openwrt.git

WORKDIR "/openwrt"

RUN bash -c "./scripts/feeds update -a"
RUN bash -c "./scripts/feeds install -a"

COPY "config.properties" "./.config"

COPY "entry.sh" "."
RUN chmod +x entry.sh

ENTRYPOINT [ "./entry.sh" ]
