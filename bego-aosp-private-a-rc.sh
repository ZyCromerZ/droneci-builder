#! /bin/bash
branch="20200907/DeathFlower-a-rc"
. main.sh 'initial'

spectrumFile="bego-on.rc"
TypeBuild="Stable-Private"
TypeBuildTag="AOSP-CFW"
getInfo ">> Building kernel . . . . <<"
KBUILD_COMPILER_STRING="Liyue clang 9.0.4"

CompileKernel