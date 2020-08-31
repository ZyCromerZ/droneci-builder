#! /bin/bash
branch="20200706/DeathFlower-upstream"
. main.sh 'initial'

spectrumFile="bego-on.rc"
TypeBuild="Stable-Private"
TypeBuildTag="AOSP-CFW"
getInfo ">> Building kernel . . . . <<"

CompileKernel