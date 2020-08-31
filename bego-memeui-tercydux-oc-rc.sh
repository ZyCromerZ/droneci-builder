#! /bin/bash
branch="mi10/20200829-Tercydux-OC-rc"
. main.sh 'initial'

spectrumFile="bego-on-memeui.rc"
TypeBuild="Stable-RC"
TypeBuildTag="Miui-A10"
getInfo ">> Building kernel . . . . <<"

CompileKernel