#! /bin/bash
branch="20201110/Tercydux-Tiris-rc"
. main.sh 'initial'

spectrumFile="bego-on.rc"
TypeBuild="Stable-TEST-RC"
TypeBuildTag="AOSP-CFW"
getInfo ">> Building kernel . . . . <<"
FolderUp="Tercy"

CompileKernel