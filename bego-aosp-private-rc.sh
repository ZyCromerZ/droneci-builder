#! /bin/bash
branch="20200706/DeathFlower-upstream-rc"
. main-a.sh 'initial'

spectrumFile="bego-on.rc"
TypeBuild="Stable-RC-Private"
TypeBuildTag="AOSP-CFW"
getInfo ">> Building kernel . . . . <<"

CompileKernel