#! /bin/bash
branch="20200907/main"
. main-a.sh 'initial'

spectrumFile="bego-on.rc"
TypeBuild="Try"
TypeBuildTag="AOSP-CFW"
getInfo ">> Building kernel . . . . <<"

CompileKernel
