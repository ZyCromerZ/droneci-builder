#! /bin/bash
branch="20201110/Tercydux-b"
BuilderKernel="00000"

. main.sh 'initial' 'full'

spectrumFile="bego-on.rc"
TypeBuild="Stable"
TypeBuildTag="AOSP-CFW"
getInfo ">> Building kernel . . . . <<"
FolderUp="Tercy"

CompileKernel