#! /bin/bash
branch="20200706/Tercydux-OC-rc"
. main.sh 'initial'

spectrumFile="bego-on.rc"
TypeBuild="Stable-RC"
TypeBuildTag="AOSP-CFW"
getInfo ">> Building kernel . . . . <<"

CompileKernel