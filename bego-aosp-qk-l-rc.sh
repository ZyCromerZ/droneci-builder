#! /bin/bash
branch="20200706/qk-l-rc"
. main.sh 'initial'

spectrumFile="bego-on.rc"
TypeBuild="Stable-RC"
TypeBuildTag="AOSP-CFW"
getInfo ">> Building kernel . . . . <<"

CompileKernel