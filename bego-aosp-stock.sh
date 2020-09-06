#! /bin/bash
branch="20200907/root-upstream"
. main.sh 'initial'

FullLto="Nope"
spectrumFile="bego-on.rc"
TypeBuild="STOCK"
TypeBuildTag="AOSP"
getInfo ">> Building kernel . . . . <<"

CompileKernel
