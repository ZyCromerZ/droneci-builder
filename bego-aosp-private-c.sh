#! /bin/bash
branch="20201110/DeathFlower-c"
. main.sh 'initial'

spectrumFile="bego-on-p.rc"
TypeBuild="Stable"
TypeBuildTag="AOSP-CFW"
getInfo ">> Building kernel . . . . <<"
KBUILD_COMPILER_STRING="Mondstadt Clang 9.0.4"

CompileKernel