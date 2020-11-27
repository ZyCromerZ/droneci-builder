#! /bin/bash
branch="20201110/df-keqing"
. main.sh 'initial'

spectrumFile="bego-on-p.rc"
TypeBuild="Personal-Stable"
TypeBuildTag="AOSP-CFW"
getInfo ">> Building kernel . . . . <<"
# KBUILD_COMPILER_STRING="Liyue Clang 9.0.4"
FolderUp="DF"

CompileKernel