# git checkout .
# make menuconfig
make k1_defconfig
make -j$(nproc) bindeb-pkg