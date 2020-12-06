#! /bin/bash
branch="20201121/qk-l"
BuilderKernel="gcc"

. main-b.sh 'initial' 'full'
export KBUILD_BUILD_VERSION=2

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

tg_send_info "All QuantumKiller-L $BuilderKernel already uploaded to Gdrive :D"