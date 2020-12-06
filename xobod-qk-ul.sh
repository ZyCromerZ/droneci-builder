#! /bin/bash
branch="20201121/qk-ul"
BuilderKernel="dtc"

. main-b.sh 'initial' 'full'
export KBUILD_BUILD_VERSION=1

spectrumFile="ul.rc"
TypeBuild="Stable"
TypeBuildTag="AOSP"
getInfo ">> Building kernel . . . . <<"
FolderUp="QK-uL"

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

tg_send_info "All QuantumKiller-uL $BuilderKernel already uploaded to Gdrive :D"