#! /bin/bash
branch="20200706/qk-n"
. main.sh 'initial'

spectrumFile="bego-on.rc"
TypeBuild="Stable"
TypeBuildTag="Miui-A10"
getInfo ">> Building kernel . . . . <<"

CompileKernel