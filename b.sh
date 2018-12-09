#!/bin/sh

export PATH=/misc/aarch64-linux-android-4.9/bin:/study/aarch64-linux-android-4.9/bin:$PATH

outdir=../out-oneplus

if [ ! -d "${outdir}" ]
then
	rm -rf "${outdir}"
	make O=${outdir} ARCH=arm64 CROSS_COMPILE=aarch64-linux-android- sdm845-perf_defconfig
fi

make O=${outdir} ARCH=arm64 CROSS_COMPILE=aarch64-linux-android- -j4

cd ${outdir}

cp -v arch/arm64/boot/Image ../bootdir/kernel
cat $(find . -name \*\.dtb) > ../bootdir/dtb
