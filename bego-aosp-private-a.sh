#! /bin/bash
branch="20200907/DeathFlower-a"
. main.sh 'initial'

spectrumFile="bego.rc"
TypeBuild="Stable-Private"
TypeBuildTag="AOSP-CFW"
getInfo ">> Building kernel . . . . <<"
KBUILD_COMPILER_STRING="Liyue Clang 9.0.4"

CompileKernel