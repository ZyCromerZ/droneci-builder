#! /bin/bash
branch="20201110/main"
. main.sh 'initial'

spectrumFile="bego-on.rc"
TypeBuild="TEST-rebased"
TypeBuildTag="AOSP-CFW"
getInfo ">> Building kernel . . . . <<"

CompileKernel