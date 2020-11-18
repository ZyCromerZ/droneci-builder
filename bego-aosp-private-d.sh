#! /bin/bash
branch="20201110/DeathFlower-d"
. main.sh 'initial'

spectrumFile="bego-on-p.rc"
TypeBuild="Stable-TEST"
TypeBuildTag="AOSP-CFW"
getInfo ">> Building kernel . . . . <<"
KBUILD_COMPILER_STRING="Mondstadt Clang 9.0.4"
FolderUp="DF"

CompileKernel