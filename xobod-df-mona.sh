#! /bin/bash
branch="20201121/df-mona"
BuilderKernel="gcc"

. main-b.sh 'initial' 'full'
export KBUILD_BUILD_VERSION=5

spectrumFile="f.rc"
TypeBuild="Stable"
TypeBuildTag="AOSP"
getInfo ">> Building kernel . . . . <<"
FolderUp="Mona"

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

tg_send_info "All DeathFlower-Mona $BuilderKernel already uploaded to Gdrive :D"