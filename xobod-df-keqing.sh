#! /bin/bash
branch="20201121/df-keqing"
BuilderKernel="clang"

. main-b.sh 'initial' 'full'
export KBUILD_BUILD_VERSION=6

spectrumFile="f.rc"
TypeBuild="Stable"
TypeBuildTag="AOSP"
getInfo ">> Building kernel . . . . <<"
FolderUp="Keqing"

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

tg_send_info "All DeathFlower-Keqing $BuilderKernel already uploaded to Gdrive :D"