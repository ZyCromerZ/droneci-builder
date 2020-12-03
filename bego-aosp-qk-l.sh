#! /bin/bash
branch="20201110/qk-l"
BuilderKernel="00000"

. main.sh 'initial' 'full'
export KBUILD_BUILD_VERSION=1

spectrumFile="bego-on.rc"
TypeBuild="Stock-LMK"
TypeBuildTag="AOSP-CFW"
getInfo ">> Building kernel . . . . <<"
FolderUp="QK"

CompileKernel
pullLmk
CompileKernel
pullSlmk
CompileKernel