#! /bin/bash
branch="mi10/20200829-Tercydux-rc"
. main.sh 'initial' 'full'

spectrumFile="bego-on-memeui.rc"
TypeBuild="Stable-RC"
TypeBuildTag="Miui-A10"
getInfo ">> Building kernel . . . . <<"

CompileKernel