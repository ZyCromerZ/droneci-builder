#! /bin/bash
branch="20201121/df-keqing"
. main-b.sh 'initial'

spectrumFile="f.rc"
TypeBuild="Stable"
TypeBuildTag="AOSP"
getInfo ">> Building kernel . . . . <<"
FolderUp="Tercy-A"

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

tg_send_info "All DeathFlower-Keqing [DTC] already uploaded to Gdrive :D"