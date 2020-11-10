#! /bin/bash
branch="20201110/Tercydux-a-rc"
. main.sh 'initial'

spectrumFile="bego-on.rc"
TypeBuild="Stable-TEST-RC"
TypeBuildTag="AOSP-CFW"
getInfo ">> Building kernel . . . . <<"

CompileKernel