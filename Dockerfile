FROM ubuntu:18.04
#FROM dockerproxy.com/library/ubuntu:18.04

RUN sed -i 's/archive.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list
# RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list

# locale set

# 设置root用户密码 
RUN echo "root:root" | chpasswd

RUN apt-get update && apt-get install -y \
    make \
    binutils \
    build-essential \
    patch \
    gzip \
    bzip2 \
    perl \
    cpio \
    unzip \
    rsync \
    file \
    bc \
    wget \
    python \
    cvs \
    git \
    mercurial \
    subversion \
    android-tools-mkbootimg \
    vim \
    libssl-dev \
    android-tools-fastboot \
    cmake \
    zlib1g-dev \
    libncurses5-dev \
    libstdc++6 \
    bear \
    curl \
    busybox

RUN apt-get install -f -y \
    && dpkg --add-architecture i386 \
    && apt update \
    && apt install -y \
    libc6:i386 \
    libstdc++6:i386 \
    gawk

COPY mkimage /usr/bin
RUN chmod +x /usr/bin/mkimage

RUN adduser public && chmod a+r /etc/bash.bashrc

USER public

RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

RUN chmod a+r /home/public/.bashrc

WORKDIR /home/public/work/arm/v853/tina-v853-open
