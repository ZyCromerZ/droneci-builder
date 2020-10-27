#! /bin/bash
branch="20200907/Tercydux-b"
. main.sh 'initial'

spectrumFile="bego-on.rc"
TypeBuild="Stable-TEST"
TypeBuildTag="AOSP-CFW"
getInfo ">> Building kernel . . . . <<"

CompileKernel