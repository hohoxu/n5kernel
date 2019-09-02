#!/bin/sh

export PATH=/misc/gcc-linaro-7.4.1-2019.02-x86_64_aarch64-linux-gnu/bin:/study/gcc-linaro-7.4.1-2019.02-x86_64_aarch64-linux-gnu/bin:$PATH

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
