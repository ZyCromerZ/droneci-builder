#! /bin/bash
branch="20200907/main"
. main.sh 'initial'

spectrumFile="bego-on.rc"
TypeBuild="STOCK"
TypeBuildTag="AOSP"
getInfo ">> Building kernel . . . . <<"

CompileKernel
