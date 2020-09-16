#! /bin/bash
branch="20200911/tercydux-a"
. main-b.sh 'initial'

spectrumFile="none"
TypeBuild="Stable-TEST"
TypeBuildTag="AOSP"
getInfo ">> Building kernel . . . . <<"

CompileKernel

FixPieWifi

CompileKernel