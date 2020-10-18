#! /bin/bash
branch="20200911/qk-ul"
. main-b.sh 'initial'

spectrumFile="ul.rc"
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