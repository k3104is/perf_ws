FROM ubuntu:24.04


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
  linux-tools-$(uname -r) \
  bpfcc-tools \
  bpftrace \
  perf-tools-unstable \
  trace-cmd \
  nicstat \
  ethtool \
  tiptop
  # cpuid \
  # msr-tools

# RUN ln -s $(find /usr/lib -type f | grep -E perf$) /usr/local/bin/

COPY ./cfg/etc/default/sysstat /etc/default/sysstat
COPY ./cfg/etc/cron.d/sysstat /etc/cron.d/sysstat

RUN service sysstat restart
RUN service cron restart

RUN apt-get install -y \
  hwloc

# bpf-tools
RUN apt install -y zip bison build-essential cmake flex git libedit-dev \
  libllvm14 llvm-14-dev libclang-14-dev python3 zlib1g-dev libelf-dev libfl-dev python3-setuptools \
  liblzma-dev libdebuginfod-dev arping netperf iperf

WORKDIR /build
RUN git clone https://github.com/iovisor/bcc.git \
  && mkdir bcc/build; cd bcc/build \
  && cmake .. \
  && make \
  && make install \
  && cmake -DPYTHON_CMD=python3 .. \
  && cd src/python/ \
  && make \
  && make install \
  && cp -r bcc-python3/bcc/* /usr/lib/python3/dist-packages/bcc/

COPY ./cfg/export.sh /
RUN echo "source /export.sh" >> /root/.bashrc
# ENV bcctools=/usr/share/bcc/tools
# ENV bccexamples=/usr/share/bcc/examples
# ENV export PATH=$bcctools:$bccexamples:$PATH