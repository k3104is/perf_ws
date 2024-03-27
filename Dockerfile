FROM ubuntu:22.04


RUN apt-get update -y
RUN apt-get install -y \
  linux-tools-generic valgrind stress psmisc strace pciutils usbutils\
  build-essential \
  vim git
RUN rm /usr/bin/perf
RUN ln -s /usr/lib/linux-tools/5.15.0-101-generic/perf /usr/bin/perf