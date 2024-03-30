FROM ubuntu:22.04


RUN apt-get update
RUN apt-get install -y \
  linux-tools-generic valgrind stress psmisc strace pciutils usbutils \
  build-essential \
  sysstat \
  vim git
RUN rm /usr/bin/perf
RUN ln -s /usr/lib/linux-tools/5.15.0-101-generic/perf /usr/bin/perf