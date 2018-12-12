#!/bin/sh

export PATH=/misc/gcc-arm-8.2-2018.11-x86_64-aarch64-linux-gnu/bin:/study/gcc-arm-8.2-2018.11-x86_64-aarch64-linux-gnu/bin:$PATH

outdir=../out-oneplus

if [ ! -d "${outdir}" ]
then
	rm -rf "${outdir}"
	make O=${outdir} ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- sdm845-perf_defconfig
fi

make O=${outdir} ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j4

cd ${outdir}

cp -v arch/arm64/boot/Image ../bootdir/kernel
cat $(find . -name \*\.dtb) > ../bootdir/dtb
