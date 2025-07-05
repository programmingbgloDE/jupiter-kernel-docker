FROM ubuntu:25.04 AS s0

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get --allow-releaseinfo-change update && apt update --fix-missing && apt upgrade -y
FROM s0 AS s1_1

RUN apt-get install -y \
                        flex \
                        bison \
                        libncurses-dev \
                        debhelper \
                        libssl-dev \
                        u-boot-tools \
                        libpfm4-dev \
                        libpfm4-dev \
                        libtraceevent-dev \
                        asciidoc \
                        xmlto \
                        git \
                        build-essential \
                        bc \
                        rsync \
                        kmod \
                        cpio \
                        python-is-python3 \
                        systemtap-sdt-dev \
                        libslang2-dev \
                        wget \
                        nano


FROM s0 AS s1_2
RUN apt install -y wget xz-utils
#RUN wget https://archive.spacemit.com/toolchain/spacemit-toolchain-linux-glibc-x86_64-v1.0.1.tar.xz -O /tmp/spacemit_glibc_toolchain.tar.xz
#RUN tar -Jxf /tmp/spacemit_glibc_toolchain.tar.xz -C /opt/
RUN wget https://archive.spacemit.com/toolchain/spacemit-toolchain-linux-glibc-x86_64-v1.0.5.tar.xz -O /tmp/spacemit_glibc_toolchain.tar.xz
RUN tar -Jxf /tmp/spacemit_glibc_toolchain.tar.xz -C /opt/

#ENV PATH=/opt/spacemit-toolchain-linux-glibc-x86_64-v1.0.0/bin:$PATH
#ENV CROSS_COMPILE=riscv64-unknown-linux-gnu-
#ENV ARCH=riscv
#ENV LOCALVERSION=""

FROM s1_1 AS final-stage

COPY --from=S1_2 /opt/spacemit-toolchain-linux-glibc-x86_64-v1.0.5 /opt/spacemit-toolchain-linux-glibc-x86_64-v1.0.5

RUN mkdir /tools
RUN mkdir /k1_kernel

COPY ./build_prequisite.sh /tools/build_prequisite.sh
COPY ./build.sh /tools/build.sh

WORKDIR /k1_kernel

ENTRYPOINT [ "/bin/bash", "-l", "-c"]