#! /bin/bash
branch="20200907/root-upstream-mod"
BuilderKernel="00000"

. main.sh 'initial'
export KBUILD_BUILD_VERSION=3

spectrumFile="bego-on.rc"
TypeBuild="STOCK"
TypeBuildTag="AOSP-CFW"
getInfo ">> Building kernel . . . . <<"

CompileKernel