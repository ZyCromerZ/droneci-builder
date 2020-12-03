#! /bin/bash
branch="20201121/df-fischl"
BuilderKernel="00000"

. main-b.sh 'initial' 'full'
export KBUILD_BUILD_VERSION=4

spectrumFile="vipn.rc"
TypeBuild="Stable"
TypeBuildTag="AOSP"
getInfo ">> Building kernel . . . . <<"
FolderUp="Fischl"

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

tg_send_info "All DeathFlower-Fischl $BuilderKernel already uploaded to Gdrive :D"