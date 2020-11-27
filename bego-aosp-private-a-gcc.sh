#! /bin/bash
branch="20201110/df-keqing"
. main.sh 'initial-gcc'

spectrumFile="bego-on-p.rc"
TypeBuild="Personal-Stable"
TypeBuildTag="AOSP-CFW"
getInfo ">> Building kernel . . . . <<"
KBUILD_COMPILER_STRING="Liyue GCC 10.2.0"
FolderUp="DF"

CompileKernelGcc