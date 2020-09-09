#! /bin/bash
branch="20200907/DeathFlower-rc"
. main.sh 'initial'

spectrumFile="bego-on.rc"
TypeBuild="Stable-RC-Private"
TypeBuildTag="AOSP-CFW"
getInfo ">> Building kernel . . . . <<"

CompileKernel