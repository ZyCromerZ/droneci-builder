#! /bin/bash
branch="20200724/root-upstream"
. main.sh 'initial' 'full'

spectrumFile="bego-on.rc"
TypeBuild="stock"
TypeBuildTag="AOSP"
getInfo ">> Building kernel . . . . <<"
SaveChatID="-1001492974035"

for GetCommit in 5b13518208a0f3f08f21889f44215227e5d2b0ad 8f4677a16a8ea6c2774598f3484b6073a154019f c242006deb4097b252b58745525950c05e58b150 de8eab9d778f42a4ad437096c1dae6cf9c2b13a2 9eae96f9c78fbef755211890dedbd99a1ffa153c
do
    cd $kernelDir
    git reset --hard $GetCommit
    git cherry-pick a10ef2fbd0df2811b3bbb237c3a6e0fca08163b5
    KVer=$(make kernelversion)
    HeadCommitId=$(git log --pretty=format:'%h' -n1)
    HeadCommitMsg=$(git log --pretty=format:'%s' -n1)
    CompileKernel "-1001492974035"
done

# for GetCommit in 072c6f2f15bea8678c79b14458a669958029e393 8d5302fac7cf663922ff81d5cf3f215d7480eb54
# do
#     cd $kernelDir
#     git reset --hard $GetCommit
#     KVer=$(make kernelversion)
#     HeadCommitId=$(git log --pretty=format:'%h' -n1)
#     HeadCommitMsg=$(git log --pretty=format:'%s' -n1)
#     CompileKernel "-1001492974035"
# done