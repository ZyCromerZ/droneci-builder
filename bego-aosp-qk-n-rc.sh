#! /bin/bash
branch="20200706/qk-n-rc"
. main.sh 'initial'

spectrumFile="bego-on.rc"
TypeBuild="Stable"
TypeBuildTag="AOSP-CFW"
getInfo ">> Building kernel . . . . <<"

CompileKernel