#! /bin/bash
branch="20201110/DeathFlower-a"
. main.sh 'initial'

spectrumFile="bego-on-p.rc"
TypeBuild="Stable"
TypeBuildTag="AOSP-CFW"
getInfo ">> Building kernel . . . . <<"
KBUILD_COMPILER_STRING="Liyue Clang 9.0.4"

CompileKernel