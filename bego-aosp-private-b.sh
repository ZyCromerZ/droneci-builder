#! /bin/bash
branch="20200907/DeathFlower-b"
. main.sh 'initial'

spectrumFile="bego-on.rc"
TypeBuild="Stable-RC-Private"
TypeBuildTag="AOSP-CFW"
getInfo ">> Building kernel . . . . <<"
KBUILD_COMPILER_STRING="Inazuma clang 9.0.4"

CompileKernel