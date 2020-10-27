#! /bin/bash
branch="20200907/DeathFlower-e"
. main.sh 'initial'

spectrumFile="bego-on-p.rc"
TypeBuild="Stable-TEST"
TypeBuildTag="AOSP-CFW"
getInfo ">> Building kernel . . . . <<"
KBUILD_COMPILER_STRING="Liyue Clang 9.0.4"

CompileKernel