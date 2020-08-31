#! /bin/bash
branch="mi10/20200829-qk-n-rc"
. main.sh 'initial'

spectrumFile="bego-on-memeui.rc"
TypeBuild="Stable-RC"
TypeBuildTag="Miui-A10"
getInfo ">> Building kernel . . . . <<"

CompileKernel