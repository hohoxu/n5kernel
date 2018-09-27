#!/bin/sh

export PATH=/home/hongxun/build/aarch64-linux-android-4.9/bin:/study/aarch64-linux-android-4.9/bin:$PATH

outdir=../out-oneplus

if [ ! -d "${outdir}" ]
then
	rm -rf "${outdir}"
	make O=${outdir} ARCH=arm64 CROSS_COMPILE=aarch64-linux-android- sdm845-perf_defconfig
fi

make O=${outdir} ARCH=arm64 CROSS_COMPILE=aarch64-linux-android- -j4

cd ${outdir}

cp -v arch/arm64/boot/Image.gz ../bootdir/kernel/
cp -v $(find . -name \*\.dtb) ../bootdir/dtbs/
cd ../bootdir
rm -f ../kernel_??????????????.zip
zip -r ../kernel_$(date +%Y%m%d%H%M%S).zip *
