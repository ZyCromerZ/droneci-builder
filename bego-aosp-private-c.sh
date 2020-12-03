#! /bin/bash
branch="20201110/df-mona"
BuilderKernel="00000"

. main.sh 'initial' 'full'
export KBUILD_BUILD_VERSION=8

spectrumFile="bego-on-p.rc"
TypeBuild="Personal-Stable"
TypeBuildTag="AOSP-CFW"
getInfo ">> Building kernel . . . . <<"
FolderUp="DF"

CompileKernel