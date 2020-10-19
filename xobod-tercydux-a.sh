#! /bin/bash
branch="20200911/tercydux-a"
. main-b.sh 'initial'

spectrumFile="none"
TypeBuild="Stable"
TypeBuildTag="AOSP"
getInfo ">> Building kernel . . . . <<"

CompileKernel
CompileKernel "65"
CompileKernel "68"
CompileKernel "71"
CompileKernel "72"

FixPieWifi

CompileKernel
CompileKernel "65"
CompileKernel "68"
CompileKernel "71"
CompileKernel "72"