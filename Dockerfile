# --- builder ---
FROM ubuntu:24.04 as builder

RUN apt update && \
  apt install -y make gcc libelf-dev clang llvm git && \
  ln -s /usr/include/asm-generic /usr/include/asm
RUN git clone https://github.com/iovisor/bcc.git && \
  cd bcc && \
  git checkout -b v0.30.0 refs/tags/v0.30.0 && \
  git submodule update --init --recursive && \
  cd libbpf-tools && \
  make -j$(nproc) && \
  make install DESTDIR=~/.local


# --- stage ---
FROM ubuntu:24.04

RUN apt update && \
  apt-get install -y \
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

# libbpf-tools
COPY --from=builder /root/.local/usr/local/bin /root/.local/bin

COPY ./cfg/export.sh /
RUN echo "source /export.sh" >> /root/.bashrc