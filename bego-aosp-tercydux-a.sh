#! /bin/bash
branch="20201110/Tercydux-a"
. main.sh 'initial'

spectrumFile="bego-on.rc"
TypeBuild="Stable-TEST"
TypeBuildTag="AOSP-CFW"
getInfo ">> Building kernel . . . . <<"

CompileKernel