#! /bin/bash
branch="20201110/qk-n-rc"
. main.sh 'initial'

spectrumFile="bego-on.rc"
TypeBuild="Stable-RC"
TypeBuildTag="AOSP-CFW"
getInfo ">> Building kernel . . . . <<"
FolderUp="QK"

CompileKernel