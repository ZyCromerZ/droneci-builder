#! /bin/bash
branch="20200911/qk-n"
. main-b.sh 'initial'

spectrumFile="vipn.rc"
TypeBuild="Stable-TEST"
TypeBuildTag="AOSP"
getInfo ">> Building kernel . . . . <<"

CompileKernel
CompileKernel "61"
CompileKernel "62"
CompileKernel "63"
CompileKernel "64"
CompileKernel "65"
CompileKernel "66"
CompileKernel "67"
CompileKernel "68"
CompileKernel "69"
CompileKernel "70"
CompileKernel "71"
CompileKernel "72"

FixPieWifi

CompileKernel
CompileKernel "61"
CompileKernel "62"
CompileKernel "63"
CompileKernel "64"
CompileKernel "65"
CompileKernel "66"
CompileKernel "67"
CompileKernel "68"
CompileKernel "69"
CompileKernel "70"
CompileKernel "71"
CompileKernel "72"