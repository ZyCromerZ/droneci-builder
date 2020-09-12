#! /bin/bash
branch="20200911/main"
. main-b.sh 'initial'

spectrumFile="none"
TypeBuild="TEST-Main"
TypeBuildTag="AOSP"
getInfo ">> Building kernel . . . . <<"

CompileKernel

FixPieWifi

CompileKernel