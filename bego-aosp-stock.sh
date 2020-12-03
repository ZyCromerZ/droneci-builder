#! /bin/bash
branch="20200907/root-upstream-mod"
BuilderKernel="dtc"

. main.sh 'initial' 'full'
export KBUILD_BUILD_VERSION=3

spectrumFile="none"
TypeBuild="STOCK"
TypeBuildTag="AOSP-CFW"
getInfo ">> Building kernel . . . . <<"

CompileKernel