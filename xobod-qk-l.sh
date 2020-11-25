#! /bin/bash
branch="20201121/qk-l"
. main-b.sh 'initial'

spectrumFile="vipn.rc"
TypeBuild="Stable"
TypeBuildTag="AOSP"
getInfo ">> Building kernel . . . . <<"
FolderUp="QK-L"

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

tg_send_info "All QuantumKiller-L [DTC] already uploaded to Gdrive :D"