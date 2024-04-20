FROM ubuntu:22.04


RUN apt-get update
RUN apt-get install -y \
  valgrind stress psmisc strace pciutils usbutils \
  build-essential \
  hdparm \
  vim git

# Linux crisis tool package
RUN apt-get install -y \
  procps \
  util-linux \
  sysstat \
  iproute2 \
  numactl \
  linux-tools-6.5.0-28-generic \
  bpfcc-tools \
  bpftrace \
  perf-tools-unstable \
  trace-cmd \
  nicstat \
  ethtool \
  tiptop \
  msr-tools

# RUN rm /usr/bin/perf
# RUN ln -s /usr/lib/linux-tools/5.15.0-105-generic/perf /usr/bin/perf