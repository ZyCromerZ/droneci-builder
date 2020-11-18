#! /bin/bash
branch="20201110/DeathFlower-e"
. main.sh 'initial'

spectrumFile="bego-on-p.rc"
TypeBuild="Stable-TEST"
TypeBuildTag="AOSP-CFW"
getInfo ">> Building kernel . . . . <<"
KBUILD_COMPILER_STRING="Liyue Clang 9.0.4"
FolderUp="DF"

CompileKernel