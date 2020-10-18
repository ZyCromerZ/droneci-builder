#! /bin/bash
branch="20200911/qk-ul"
. main-b.sh 'initial'

spectrumFile="ul.rc"
TypeBuild="Stable-TEST"
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