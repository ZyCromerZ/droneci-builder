#! /bin/bash
branch="20201110/Tercydux-Tiris"
BuilderKernel="gcc"

. main.sh 'initial'

spectrumFile="bego-on.rc"
TypeBuild="Stable"
TypeBuildTag="AOSP-CFW"
getInfo ">> Building kernel . . . . <<"
FolderUp="Tercy"

CompileKernel