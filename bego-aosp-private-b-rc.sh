#! /bin/bash
branch="20200907/DeathFlower-b-rc"
. main.sh 'initial'

spectrumFile="bego.rc"
TypeBuild="Stable-RC-Private"
TypeBuildTag="AOSP-CFW"
getInfo ">> Building kernel . . . . <<"
KBUILD_COMPILER_STRING="Inazuma Clang 9.0.4"

CompileKernel