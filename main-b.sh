#! /bin/bash

 # Script For Building Android Kernel
 #
 # Copyright (c) 2020 ZyCromerZ <DarkNeetXT97@gmail.com>
 #
 # Licensed under the Apache License, Version 2.0 (the "License");
 # you may not use this file except in compliance with the License.
 # You may obtain a copy of the License at
 #
 #      http://www.apache.org/licenses/LICENSE-2.0
 #
 # Unless required by applicable law or agreed to in writing, software
 # distributed under the License is distributed on an "AS IS" BASIS,
 # WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 # See the License for the specific language governing permissions and
 # limitations under the License.
 #

# Function to show an informational message
# need to defined
# - branch
# - spectrumFile
# Then call CompileKernel and done

getInfo() {
    echo -e "\e[1;32m$*\e[0m"
}

getInfoErr() {
    echo -e "\e[1;41m$*\e[0m"
}

mainDir=$PWD

kernelDir=$mainDir/kernel

clangDir=$mainDir/clang

gcc64Dir=$mainDir/gcc64

gcc32Dir=$mainDir/gcc32

AnykernelDir=$mainDir/Anykernel3

SpectrumDir=$mainDir/Spectrum

GdriveDir=$mainDir/Gdrive-Uploader


if [ ! -z "$1" ] && [ "$1" == 'initial' ];then
    apt-get -y update && apt-get -y upgrade && apt-get -y install tzdata git automake lzop bison gperf build-essential zip curl zlib1g-dev g++-multilib libxml2-utils bzip2 libbz2-dev libbz2-1.0 libghc-bzlib-dev squashfs-tools pngcrush schedtool dpkg-dev liblz4-tool make optipng bc libstdc++6 wget python3 python3-pip python gcc clang libssl-dev rsync flex git-lfs libz3-dev libz3-4 axel tar && python3 -m pip  install networkx

    if [ ! -z "$2" ] && [ "$2" == 'full' ];then
        getInfo ">> cloning kernel full . . . <<"
        git clone https://$GIT_SECRET@github.com/ZyCromerZ/X01BD_kernel -b "$branch" $kernelDir
    else
        getInfo ">> cloning kernel . . . <<"
        git clone https://$GIT_SECRET@github.com/ZyCromerZ/X01BD_kernel -b "$branch" $kernelDir --depth=1 
    fi
    [ -z "$BuilderKernel" ] && BuilderKernel="clang"
    if [ "$BuilderKernel" == "clang" ];then
        getInfo ">> cloning proton clang 12 . . . <<"
        git clone https://github.com/kdrag0n/proton-clang -b master $clangDir --depth=1
    fi
    if [ "$BuilderKernel" == "dtc" ];then
        getInfo ">> cloning DragonTC clang 10 . . . <<"
        git clone https://github.com/NusantaraDevs/DragonTC -b 10.0 $clangDir --depth=1
    fi
    # if [ "$BuilderKernel" == "gcc" ];then
        getInfo ">> cloning gcc64 . . . <<"
        git clone https://github.com/ZyCromerZ/aarch64-linux-android-4.9/ -b android-10.0.0_r47 $gcc64Dir --depth=1
        getInfo ">> cloning gcc32 . . . <<"
        git clone https://github.com/ZyCromerZ/arm-linux-androideabi-4.9/ -b android-10.0.0_r47 $gcc32Dir --depth=1
        for64=aarch64-linux-android
        for32=arm-linux-androideabi
    # else
    #     getInfo ">> cloning gcc64 . . . <<"
    #     git clone https://github.com/ZyCromerZ/aarch64-linux-gnu-1 -b stable-gcc $gcc64Dir --depth=1
    #     getInfo ">> cloning gcc32 . . . <<"
    #     git clone https://github.com/ZyCromerZ/arm-linux-gnueabi -b stable-gcc $gcc32Dir --depth=1
    #     for64=aarch64-linux-gnu
    #     for32=arm-linux-gnueabi
    # fi

    getInfo ">> cloning Anykernel . . . <<"
    git clone https://github.com/ZyCromerZ/AnyKernel3 -b master $AnykernelDir --depth=1
    getInfo ">> cloning Spectrum . . . <<"
    git clone https://github.com/ZyCromerZ/Spectrum -b master $SpectrumDir --depth=1
    getInfo ">> cloning Gdrive Uploader . . . <<"
    git clone https://$GIT_SECRET@github.com/ZyCromerZ/gdrive_uploader -b master $GdriveDir --depth=1 
    
    DEVICE="Asus Max Pro M2"
    CODENAME="X01BD"
    SaveChatID="-1001426291932"
    ARCH="arm64"
    TypeBuild="Stable"
    DEFFCONFIG="X01BD_defconfig"
    GetBD=$(date +"%m%d")
    GetCBD=$(date +"%Y-%m-%d")
    TotalCores=$(nproc --all)
    TypeBuildTag="AOSP"
    KernelFor='Q'
    SendInfo='belum'
    RefreshRate="60"
    SetTag="LA.UM.8.2.r1"
    SetLastTag="sdm660.0"
    FolderUp=""
    export KBUILD_BUILD_USER="ZyCromerZ"
    export KBUILD_BUILD_HOST="DroneCI-server"
    # export KBUILD_BUILD_VERSION=$DRONE_BUILD_NUMBER
    if [ "$BuilderKernel" == "gcc" ];then
        ClangType="$($gcc64Dir/bin/$for64-gcc --version | head -n 1)"
    else
        ClangType="$($clangDir/bin/clang --version | head -n 1)"
    fi
    KBUILD_COMPILER_STRING="$ClangType"
    if [ -e $gcc64Dir/bin/$for64-gcc ];then
        gcc64Type="$($gcc64Dir/bin/$for64-gcc --version | head -n 1)"
    else
        cd $gcc64Dir
        gcc64Type=$(git log --pretty=format:'%h: %s' -n1)
        cd $mainDir
    fi
    if [ -e $gcc32Dir/bin/$for32-gcc ];then
        gcc32Type="$($gcc32Dir/bin/$for32-gcc --version | head -n 1)"
    else
        cd $gcc32Dir
        gcc32Type=$(git log --pretty=format:'%h: %s' -n1)
        cd $mainDir
    fi
    cd $kernelDir
    KVer=$(make kernelversion)
    HeadCommitId=$(git log --pretty=format:'%h' -n1)
    HeadCommitMsg=$(git log --pretty=format:'%s' -n1)
    cd $mainDir
fi

tg_send_info(){
    if [ ! -z "$2" ];then
        curl -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" -d chat_id="$2" \
        -d "disable_web_page_preview=true" \
        -d "parse_mode=html" \
        -d text="$1"
    else
        curl -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" -d chat_id="-1001426291932" \
        -d "disable_web_page_preview=true" \
        -d "parse_mode=html" \
        -d text="$1"
    fi
}

tg_send_files(){
    KernelFiles="$(pwd)/$RealZipName"
	MD5CHECK=$(md5sum "$KernelFiles" | cut -d' ' -f1)
    MSG="✅ <b>Build Success</b> 
- <code>$((DIFF / 60)) minute(s) $((DIFF % 60)) second(s) </code> 

<b>MD5 Checksum</b>
- <code>$MD5CHECK</code>

<b>Zip Name</b> 
- <code>$ZipName</code>"

	# curl --progress-bar -F document=@"$KernelFiles" "https://api.telegram.org/bot$BOT_TOKEN/sendDocument" \
	# -F chat_id="$SaveChatID"  \
	# -F "disable_web_page_preview=true" \
	# -F "parse_mode=html" \
	# -F caption="$MSG"

    currentFolder="$(pwd)"
    cd $GdriveDir
    chmod +x run.sh
    . run.sh "$KernelFiles" "x01bd" "$(date +"%m-%d-%Y")" "$FolderUp"
    cd $currentFolder

    # if [ ! -z "$1" ];then
    #     tg_send_info "$MSG" "$1"
    # else
    #     tg_send_info "$MSG"
    # fi
    # remove files after build done
    rm -rf $KernelFiles
}

CompileKernel(){
    cd $kernelDir
    export KBUILD_COMPILER_STRING
    if [ "$BuilderKernel" == "gcc" ];then
        MAKE+=(
                ARCH=$ARCH \
                SUBARCH=$ARCH \
                PATH=$gcc64Dir/bin:$gcc32Dir/bin:/usr/bin:${PATH} \
                CROSS_COMPILE=aarch64-linux-android- \
                CROSS_COMPILE_ARM32=arm-linux-androideabi-
        )
    else
        MAKE+=(
                ARCH=$ARCH \
                SUBARCH=$ARCH \
                PATH=$clangDir/bin:$gcc64Dir/bin:$gcc32Dir/bin:/usr/bin:${PATH} \
                CC=clang \
                CROSS_COMPILE=$for64- \
                CROSS_COMPILE_ARM32=$for32- \
                AR=llvm-ar \
                AS=llvm-as \
                NM=llvm-nm \
                STRIP=llvm-strip \
                OBJCOPY=llvm-objcopy \
                OBJDUMP=llvm-objdump \
                OBJSIZE=llvm-size \
                READELF=llvm-readelf \
                HOSTCC=clang \
                HOSTCXX=clang++ \
                HOSTAR=llvm-ar \
                CLANG_TRIPLE=aarch64-linux-gnu-
        )
    fi
    # rm -rf out # always remove out directory :V
    BUILD_START=$(date +"%s")
    if [ "$SendInfo" != 'sudah' ];then
        if [ "$BuilderKernel" == "gcc" ];then
            MSG="<b>🔨 New Kernel On The Way</b>%0A<b>Device: $DEVICE</b>%0A<b>Codename: $CODENAME</b>%0A<b>Branch: $branch</b>%0A<b>Build Date: $GetCBD </b>%0A<b>Build Number: $DRONE_BUILD_NUMBER </b>%0A<b>Build Link Progress:</b><a href='https://cloud.drone.io/DarkNeetXT/droneci-builder/$DRONE_BUILD_NUMBER/1/2'> Check Here </a>%0A<b>Host Core Count : $TotalCores cores </b>%0A<b>Kernel Version: $KVer</b>%0A<b>Last Commit-Id: $HeadCommitId </b>%0A<b>Last Commit-Message: $HeadCommitMsg </b>%0A<b>Builder Info: </b>%0A<code>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</code>%0A<code>- $gcc64Type </code>%0A<code>- $gcc32Type </code>%0A<code>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</code>%0A%0A #$TypeBuildTag  #$TypeBuild"
        else
            MSG="<b>🔨 New Kernel On The Way</b>%0A<b>Device: $DEVICE</b>%0A<b>Codename: $CODENAME</b>%0A<b>Branch: $branch</b>%0A<b>Build Date: $GetCBD </b>%0A<b>Build Number: $DRONE_BUILD_NUMBER </b>%0A<b>Build Link Progress:</b><a href='https://cloud.drone.io/DarkNeetXT/droneci-builder/$DRONE_BUILD_NUMBER/1/2'> Check Here </a>%0A<b>Host Core Count : $TotalCores cores </b>%0A<b>Kernel Version: $KVer</b>%0A<b>Last Commit-Id: $HeadCommitId </b>%0A<b>Last Commit-Message: $HeadCommitMsg </b>%0A<b>Builder Info: </b>%0A<code>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</code>%0A<code>- $ClangType </code>%0A<code>- $gcc64Type </code>%0A<code>- $gcc32Type </code>%0A<code>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</code>%0A%0A #$TypeBuildTag  #$TypeBuild"
        fi
        if [ ! -z "$1" ];then
            tg_send_info "$MSG" "$1"
        else
            tg_send_info "$MSG" 
        fi
        SendInfo='sudah'
    fi
    git reset --hard $HeadCommitId
    if [ ! -z "$1" ] && [ $1 != "60" ];then
        update_file "qcom,mdss-dsi-panel-framerate = " "qcom,mdss-dsi-panel-framerate = <$1>;" "./arch/arm/boot/dts/qcom/X01BD/dsi-panel-hx83112a-1080p-video-tm.dtsi" && \
        update_file "qcom,mdss-dsi-panel-framerate = " "qcom,mdss-dsi-panel-framerate = <$1>;" "./arch/arm/boot/dts/qcom/X01BD/dsi-panel-nt36672ah-1080p-video-kd.dtsi"
        RefreshRate="$1"
    fi
    GetKernelName="$(cat "./arch/$ARCH/configs/$DEFFCONFIG" | grep "CONFIG_LOCALVERSION=" | sed 's/"//g' | sed 's/CONFIG_LOCALVERSION=//g')"
    KernelName='"'$GetKernelName'-'$RefreshRate'Hz"'
    update_file "CONFIG_LOCALVERSION=" "CONFIG_LOCALVERSION=$KernelName" "./arch/$ARCH/configs/$DEFFCONFIG"
    LastHeadCommitId=$(git log --pretty=format:'%h' -n1)
    TAGKENEL="$(git log | grep "${SetTag}" | head -n 1 | awk -F '\\'${SetLastTag}'' '{print $1"'${SetLastTag}'"}' | awk -F '\\'${SetTag}'' '{print "'${SetTag}'"$2}')"
    if [ ! -z "$TAGKENEL" ];then
        export KBUILD_BUILD_HOST="DroneCI-server-$TAGKENEL"
    fi
    make -j${TotalCores}  O=out ARCH="$ARCH" "$DEFFCONFIG"
    if [ "$BuilderKernel" == "gcc" ];then
        make -j${TotalCores}  O=out \
            ARCH=$ARCH \
            SUBARCH=$ARCH \
            PATH=$clangDir/bin:$gcc64Dir/bin:$gcc32Dir/bin:/usr/bin:${PATH} \
            CROSS_COMPILE=aarch64-linux-android- \
            CROSS_COMPILE_ARM32=arm-linux-androideabi-
    else
        make -j${TotalCores}  O=out \
            ARCH=$ARCH \
            SUBARCH=$ARCH \
            PATH=$clangDir/bin:$gcc64Dir/bin:$gcc32Dir/bin:/usr/bin:${PATH} \
            CC=clang \
            CROSS_COMPILE=$for64- \
            CROSS_COMPILE_ARM32=$for32- \
            AR=llvm-ar \
            AS=llvm-as \
            NM=llvm-nm \
            STRIP=llvm-strip \
            OBJCOPY=llvm-objcopy \
            OBJDUMP=llvm-objdump \
            OBJSIZE=llvm-size \
            READELF=llvm-readelf \
            HOSTCC=clang \
            HOSTCXX=clang++ \
            HOSTAR=llvm-ar \
            CLANG_TRIPLE=aarch64-linux-gnu-
    fi
    BUILD_END=$(date +"%s")
    DIFF=$((BUILD_END - BUILD_START))
    if [ -f $kernelDir/out/arch/$ARCH/boot/Image.gz-dtb ];then
        cp -af $kernelDir/out/arch/$ARCH/boot/Image.gz-dtb $AnykernelDir
        KName=$(cat "$(pwd)/arch/$ARCH/configs/$DEFFCONFIG" | grep "CONFIG_LOCALVERSION=" | sed 's/CONFIG_LOCALVERSION="-*//g' | sed 's/"*//g' )
        [[ "$BuilderKernel" == "gcc" ]] && TypeBuilder="GCC"
        [[ "$BuilderKernel" == "clang" ]] && TypeBuilder="Clang"
        [[ "$BuilderKernel" == "dtc" ]] && TypeBuilder="DTC"
        if [ $TypeBuild == "Stable" ];then
            ZipName="[$GetBD][$TypeBuilder][${RefreshRate}Hz][$KernelFor][$CODENAME]$KVer-$KName-$LastHeadCommitId.zip"
        else
            ZipName="[$GetBD][$TypeBuilder][${RefreshRate}Hz][$KernelFor][$TypeBuild][$CODENAME]$KVer-$KName-$LastHeadCommitId.zip"
        fi
        # RealZipName="[$GetBD]$KVer-$HeadCommitId.zip"
        RealZipName="$ZipName"
        if [ ! -z "$2" ];then
            MakeZip "$2"
        else
            MakeZip
        fi
    else
        MSG="<b>❌ Build failed</b>%0A- <code>$((DIFF / 60)) minute(s) $((DIFF % 60)) second(s)</code>%0A%0ASad Boy"
        if [ ! -z "$2" ];then
            tg_send_info "$MSG" "$2"
        else
            tg_send_info "$MSG" 
        fi
        exit -1
    fi
}


MakeZip(){
    cd $AnykernelDir
    if [ ! -z "$spectrumFile" ];then
        cp -af $SpectrumDir/$spectrumFile init.spectrum.rc && sed -i "s/persist.spectrum.kernel.*/persist.spectrum.kernel $KName/g" init.spectrum.rc
    fi
    cp -af anykernel-real.sh anykernel.sh && sed -i "s/kernel.string=.*/kernel.string=$KName-$HeadCommitId by ZyCromerZ/g" anykernel.sh

    zip -r9 "$RealZipName" * -x .git README.md anykernel-real.sh .gitignore *.zip
    if [ ! -z "$1" ];then
        tg_send_files "$1"
    else
        tg_send_files
    fi

}

FixPieWifi()
{
    cd $kernelDir
    git reset --hard origin/$branch
    git revert e33d9b9a45b44e73b55657e44ea4c7e4584ce848 --no-commit
    git commit -s -m "Fix wifi broken for Android 9"
    KVer=$(make kernelversion)
    HeadCommitId=$(git log --pretty=format:'%h' -n1)
    HeadCommitMsg=$(git log --pretty=format:'%s' -n1)
    KernelFor='P'
    RefreshRate="60"
    rm -rf out
    cd $mainDir
}

update_file() {
    if [ ! -z "$1" ] && [ ! -z "$2" ] && [ ! -z "$3" ];then
        GetValue="$(cat $3 | grep "$1")"
        GetPath=${3/"."/""}
        ValOri="$(echo "$GetValue" | awk -F '\\=' '{print $2}')"
        UpdateTo="$(echo "$2" | awk -F '\\=' '{print $2}')"
        [ "$ValOri" != "$UpdateTo" ] && \
        sed -i "s/$1.*/$2/g" "$3"
        [ ! -z "$(git status | grep "modified" )" ] && \
        git add "$3" && \
        git commit -s -m "$GetPath: '$GetValue' update to '$2'"
    fi
}

getInfo 'include main.sh success'