#! /bin/bash
branch="tercydux/20200825/a"
. main-b.sh 'initial'

spectrumFile="f.rc"
TypeBuild="Stable-Private"
TypeBuildTag="AOSP"
getInfo ">> Building kernel . . . . <<"

CompileKernel

FixPieWifi

CompileKernel