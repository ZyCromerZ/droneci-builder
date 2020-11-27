#! /bin/bash
branch="20201110/Tercydux-Tiris"
. main.sh 'initial-gcc'

spectrumFile="bego-on.rc"
TypeBuild="Stable"
TypeBuildTag="AOSP-CFW"
getInfo ">> Building kernel . . . . <<"
FolderUp="Tercy"

CompileKernel