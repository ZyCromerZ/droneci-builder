#! /bin/bash
branch="20201110/df-keqing-rc"
. main.sh 'initial'

spectrumFile="bego-on-p.rc"
TypeBuild="Personal-Stable-RC"
TypeBuildTag="AOSP-CFW"
getInfo ">> Building kernel . . . . <<"
KBUILD_COMPILER_STRING="Liyue Clang 9.0.4"

CompileKernel