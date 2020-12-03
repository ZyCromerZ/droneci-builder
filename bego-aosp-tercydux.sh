#! /bin/bash
branch="20201110/Tercydux-Santuy"
BuilderKernel="00000"

. main.sh 'initial' 'full'
export KBUILD_BUILD_VERSION=5

spectrumFile="bego-on.rc"
TypeBuild="Stable"
TypeBuildTag="AOSP-CFW"
getInfo ">> Building kernel . . . . <<"
FolderUp="Tercy"

CompileKernel