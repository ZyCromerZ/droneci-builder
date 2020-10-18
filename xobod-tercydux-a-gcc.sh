#! /bin/bash
branch="20200911/tercydux-a"
. main-b.sh 'initial'

spectrumFile="none"
TypeBuild="Stable-TEST"
TypeBuildTag="AOSP"
getInfo ">> Building kernel . . . . <<"

CompileKernelGcc
CompileKernelGcc "65"
CompileKernelGcc "68"
CompileKernelGcc "71"
CompileKernelGcc "72"

FixPieWifi

CompileKernelGcc
CompileKernelGcc "65"
CompileKernelGcc "68"
CompileKernelGcc "71"
CompileKernelGcc "72"