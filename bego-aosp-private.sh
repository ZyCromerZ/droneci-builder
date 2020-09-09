#! /bin/bash
branch="20200907/DeathFlower"
. main.sh 'initial'

spectrumFile="bego-on.rc"
TypeBuild="Stable-Private"
TypeBuildTag="AOSP-CFW"
getInfo ">> Building kernel . . . . <<"

CompileKernel