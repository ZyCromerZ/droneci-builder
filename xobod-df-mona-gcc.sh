#! /bin/bash
branch="20201121/df-mona"
. main-b.sh 'initial-gcc'

spectrumFile="f.rc"
TypeBuild="Stable"
TypeBuildTag="AOSP"
getInfo ">> Building kernel . . . . <<"
FolderUp="Mona"

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

tg_send_info "All DeathFlower-Mona [GCC] already uploaded to Gdrive :D"