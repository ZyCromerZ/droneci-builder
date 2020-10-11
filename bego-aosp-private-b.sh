#! /bin/bash
branch="20200907/DeathFlower-b"
. main.sh 'initial'

spectrumFile="bego.rc"
TypeBuild="Stable-Private"
TypeBuildTag="AOSP-CFW"
getInfo ">> Building kernel . . . . <<"
KBUILD_COMPILER_STRING="Inazuma Clang 9.0.4"

CompileKernel