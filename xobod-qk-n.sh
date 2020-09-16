#! /bin/bash
branch="20200911/qk-n"
. main-b.sh 'initial'

spectrumFile="none"
TypeBuild="Stable-TEST"
TypeBuildTag="AOSP"
getInfo ">> Building kernel . . . . <<"

CompileKernel

FixPieWifi

CompileKernel