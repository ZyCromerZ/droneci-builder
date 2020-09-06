#! /bin/bash
branch="20200724/root-upstream"
. main.sh 'initial'

spectrumFile="bego-on.rc"
TypeBuild="STOCK"
TypeBuildTag="AOSP"
getInfo ">> Building kernel . . . . <<"

CompileKernel
