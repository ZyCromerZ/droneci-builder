#! /bin/bash
branch="private/20200825/a"
. main.sh 'initial' 'full'

spectrumFile="bego-on.rc"
TypeBuild="stock"
TypeBuildTag="AOSP"
getInfo ">> Building kernel . . . . <<"

for GetCommit in a07f95f7dc0397ecdce36358e84af053a882f0d1 a2872257122a652104ca41d96c7d6d1a037acbe7 7d1095fb74bd7386227d57e1d80fd38077bae2c2 ff787cfb4eb2f9e30b6c53daef4aa9eaa0a53faa 53e45a3339ff7e9b905eb446d9286bdb10b779cb 038d5a0118dee26a7687329d5bc0b6d49db9c2d5
do
    cd $kernelDir
    git reset --hard $GetCommit
    git cherry-pick a10ef2fbd0df2811b3bbb237c3a6e0fca08163b5
    KVer=$(make kernelversion)
    HeadCommitId=$(git log --pretty=format:'%h' -n1)
    HeadCommitMsg=$(git log --pretty=format:'%s' -n1)
    CompileKernel "-1001492974035"
done

for GetCommit in 072c6f2f15bea8678c79b14458a669958029e393 8d5302fac7cf663922ff81d5cf3f215d7480eb54
do
    cd $kernelDir
    git reset --hard $GetCommit
    KVer=$(make kernelversion)
    HeadCommitId=$(git log --pretty=format:'%h' -n1)
    HeadCommitMsg=$(git log --pretty=format:'%s' -n1)
    CompileKernel "-1001492974035"
done