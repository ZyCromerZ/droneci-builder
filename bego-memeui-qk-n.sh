#! /bin/bash
branch="mi10/20200829-qk-n"
. main.sh 'initial'

spectrumFile="bego-on-memeui.rc"
TypeBuild="Stable"
TypeBuildTag="Miui-A10"
getInfo ">> Building kernel . . . . <<"

CompileKernel