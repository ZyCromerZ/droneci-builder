#! /bin/bash
branch="20200911/deathflower"
. main-b.sh 'initial'

spectrumFile="f.rc"
TypeBuild="Stable-Private"
TypeBuildTag="AOSP"
getInfo ">> Building kernel . . . . <<"

CompileKernel

FixPieWifi

CompileKernel