FROM ubuntu:22.04


RUN apt-get update
RUN apt-get install -y \
  valgrind stress psmisc strace pciutils usbutils \
  build-essential \
  hdparm \
  vim git cron

# Linux crisis tool package
RUN apt-get install -y \
  procps \
  util-linux \
  sysstat \
  iproute2 \
  numactl \
  tcpdump \
  linux-tools-common \
  bpfcc-tools \
  bpftrace \
  perf-tools-unstable \
  trace-cmd \
  nicstat \
  ethtool \
  tiptop \
  cpuid \
  msr-tools

RUN ln -s $(find /usr/lib -type f | grep -E perf$) /usr/local/bin/

COPY ./cfg/etc/default/sysstat /etc/default/sysstat
COPY ./cfg/etc/cron.d/sysstat /etc/cron.d/sysstat

RUN service sysstat restart
RUN service cron restart