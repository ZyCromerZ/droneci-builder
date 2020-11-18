#! /bin/bash
branch="20201110/DeathFlower-b"
. main.sh 'initial'

spectrumFile="bego-on-p.rc"
TypeBuild="Stable"
TypeBuildTag="AOSP-CFW"
getInfo ">> Building kernel . . . . <<"
KBUILD_COMPILER_STRING="Inazuma Clang 9.0.4"
FolderUp="DF"

CompileKernel