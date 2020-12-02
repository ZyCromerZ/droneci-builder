#! /bin/bash
branch="20201110/df-keqing"
BuilderKernel="gcc"

. main.sh 'initial'

spectrumFile="bego-on-p.rc"
TypeBuild="Personal-Stable"
TypeBuildTag="AOSP-CFW"
getInfo ">> Building kernel . . . . <<"
FolderUp="DF"

CompileKernel