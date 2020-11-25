#! /bin/bash
branch="20201121/main"
. main-b.sh 'initial'

spectrumFile="none"
TypeBuild="TEST-Main"
TypeBuildTag="AOSP"
getInfo ">> Building kernel . . . . <<"

CompileKernelGcc
# CompileKernelGcc "65"
# CompileKernelGcc "68"
# CompileKernelGcc "71"
# CompileKernelGcc "72"

FixPieWifi

CompileKernelGcc
# CompileKernelGcc "65"
# CompileKernelGcc "68"
# CompileKernelGcc "71"
# CompileKernelGcc "72"

tg_send_info "All $GetKernelName already uploaded to Gdrive :D"