#! /bin/bash
branch="lineage-17.1"
. main.sh 'initial'

TypeBuild="Stable"
TypeBuildTag="AOSP"
getInfo ">> Building kernel . . . . <<"

CompileKernel