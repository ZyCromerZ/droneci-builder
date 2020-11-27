#! /bin/bash
branch="20201110/qk-l"
. main.sh 'initial-gcc'

spectrumFile="bego-on.rc"
TypeBuild="Stable"
TypeBuildTag="AOSP-CFW"
getInfo ">> Building kernel . . . . <<"
FolderUp="QK"

CompileKernel