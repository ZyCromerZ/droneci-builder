#! /bin/bash
branch="20200907/Tercydux-b-rc"
. main.sh 'initial'

spectrumFile="bego-on.rc"
TypeBuild="Stable-TEST-RC"
TypeBuildTag="AOSP-CFW"
getInfo ">> Building kernel . . . . <<"

CompileKernel