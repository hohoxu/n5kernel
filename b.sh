#!/bin/sh

make mrproper
make mpc_defconfig
make -j4
