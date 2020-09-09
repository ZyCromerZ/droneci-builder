#! /bin/bash
branch="20200907/main"
. main-a.sh 'initial'

spectrumFile="bego-on.rc"
TypeBuild="clang-9.0.8"
TypeBuildTag="AOSP-CFW"
getInfo ">> Building kernel . . . . <<"

CompileKernel

rm -rf $clangDir
rm -rf $kernelDir/out
git clone https://github.com/ZyCromerZ/google-clang -b 11.0.2-r383902b $clangDir --depth=1

TypeBuild="clang-11.0.2"
getInfo ">> Building kernel . . . . <<"

CompileKernel