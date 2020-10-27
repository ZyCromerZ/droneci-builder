#! /bin/bash
branch="20200907/DeathFlower-b-rc"
. main.sh 'initial'

spectrumFile="bego-on-p.rc"
TypeBuild="Stable-RC"
TypeBuildTag="AOSP-CFW"
getInfo ">> Building kernel . . . . <<"
KBUILD_COMPILER_STRING="Inazuma Clang 9.0.4"

CompileKernel