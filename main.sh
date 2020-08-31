#! /bin/bash

 # Script For Building Android Kernel
 #
 # Copyright (c) 2018-2020 Panchajanya1999 <rsk52959@gmail.com>
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

if [ ! -z "$1" ] && [ "$1" == 'initial' ];then
    getInfo ">> cloning kernel . . . <<"
    git clone https://$GIT_SECRET@github.com/ZyCromerZ/begonia_kernel -b "$branch" $kernelDir --depth=1 
    getInfo ">> cloning clang . . . <<"
    git clone https://github.com/ZyCromerZ/google-clang -b 9.0.4-r353983d $clangDir --depth=1
    getInfo ">> cloning gcc64 . . . <<"
    git clone https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/ -b android-10.0.0_r45 $gcc64Dir --depth=1
    getInfo ">> cloning gcc32 . . . <<"
    git clone https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/ -b android-10.0.0_r45 $gcc32Dir --depth=1
    getInfo ">> cloning Anykernel . . . <<"
    git clone https://github.com/ZyCromerZ/AnyKernel3 -b master-begonia $AnykernelDir --depth=1
    getInfo ">> cloning Spectrum . . . <<"
    git clone https://github.com/ZyCromerZ/Spectrum -b master $SpectrumDir --depth=1
    
    DEVICE="Redmi Note 8 pro"
    CODENAME="Begonia"
    SaveChatID="-1001301538740"
    ARCH="arm64"
    TypeBuild="Stable"
    DEFFCONFIG="begonia_user_defconfig"
    GetBD=$(date +"%m%d")
    GetCBD=$(date +"%Y-%m-%d")
    TotalCores=$(nproc --all)
    TypeBuildTag="AOSP-CFW"
    export KBUILD_BUILD_USER="ZyCromerZ"
    export KBUILD_BUILD_HOST="DroneCI-server"
    ClangType="$($clangDir/bin/clang --version | head -n 1)"
    if [ -e $gcc64Dir/bin/aarch64-linux-android-gcc ];then
        gcc64Type="$($gcc64Dir/bin/aarch64-linux-android-gcc --version | head -n 1)"
    else
        cd $gcc64Dir
        gcc64Type=$(git log --pretty=format:'%h: %s' -n1)
        cd $mainDir
    fi
    if [ -e $gcc32Dir/bin/arm-linux-androideabi-gcc ];then
        gcc32Type="$($gcc32Dir/bin/arm-linux-androideabi-gcc --version | head -n 1)"
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
        curl -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" -d chat_id="-1001150624898" \
        -d "disable_web_page_preview=true" \
        -d "parse_mode=html" \
        -d text="$1"
    fi
}

tg_send_files(){
	MD5CHECK=$(md5sum "$(pwd)/$ZipName" | cut -d' ' -f1)
	curl --progress-bar -F document=@"$(pwd)/$ZipName" "https://api.telegram.org/bot$BOT_TOKEN/sendDocument" \
	-F chat_id="$SaveChatID"  \
	-F "disable_web_page_preview=true" \
	-F "parse_mode=html" \
	-F caption="✅ <b>Build Success : $((DIFF / 60)):$((DIFF % 60)) </b>%0A<b>MD5 Checksum : </b><code>$MD5CHECK</code>Zip Name : <code>$ZipName</code>"
    tg_send_info "✅ <b>Build Success : $((DIFF / 60)):$((DIFF % 60)) </b>%0A<b>MD5 Checksum : </b><code>$MD5CHECK</code>Zip Name : <code>$ZipName</code>"
    # remove files after build done
    rm -rf $(pwd)/$ZipName
}

CompileKernel(){
    cd $kernelDir
    MAKE+=(
            ARCH=$ARCH \
            SUBARCH=$ARCH \
            PATH=$clangDir/bin:$gcc64Dir/bin/:$gcc32Dir/bin/:/usr/bin:${PATH} \
            LD_LIBRARY_PATH="$clangDir/lib64:${LD_LIBRARY_PATH}" \
            CC=clang \
            CROSS_COMPILE=aarch64-linux-android- \
            CROSS_COMPILE_ARM32=arm-linux-androideabi- \
            AS=llvm-as \
            NM=llvm-nm \
            OBJDUMP=llvm-objdump \
            OBJSIZE=llvm-size \
            READELF=llvm-readelf \
            STRIP=llvm-strip \
            HOSTCC=clang \
            HOSTCXX=clang++ \
            HOSTLD=ld.lld \
            LD=ld.lld \
            CLANG_TRIPLE=aarch64-linux-gnu-
    )
    rm -rf out # always remove out directory :V
    BUILD_START=$(date +"%s")
    tg_send_info "<b>🔨 New Kernel On The Way</b>%0A<b>Branch: $branch</b>%0A<b>Host Core Count : $TotalCores cores </b>%0A<b>Kernel Version: $KVer</b>%0A<b>Commit-Id: $HeadCommitId </b>%0A<b>Commit-Message: $HeadCommitMsg </b>%0A<b>Build Date: $GetCBD </b>%0A<b>Builder Info: </b>%0A<code>-----</code>%0A<code>- $ClangType </code>%0A<code>- $gcc64Type </code>%0A<code>- $gcc32Type </code>%0A#$TypeBuildTag #$TypeBuild"
    make -j${TotalCores}  O=out ARCH="$ARCH" "$DEFFCONFIG"
    make -j${TotalCores}  O=out \
        ARCH=$ARCH \
        SUBARCH=$ARCH \
        PATH=$clangDir/bin:$gcc64Dir/bin/:$gcc32Dir/bin/:/usr/bin:${PATH} \
        LD_LIBRARY_PATH="$clangDir/lib64:${LD_LIBRARY_PATH}" \
        CC=clang \
        CROSS_COMPILE=aarch64-linux-android- \
        CROSS_COMPILE_ARM32=arm-linux-androideabi- \
        AS=llvm-as \
        NM=llvm-nm \
        OBJDUMP=llvm-objdump \
        OBJSIZE=llvm-size \
        READELF=llvm-readelf \
        STRIP=llvm-strip \
        HOSTCC=clang \
        HOSTCXX=clang++ \
        HOSTLD=ld.lld \
        LD=ld.lld \
        CLANG_TRIPLE=aarch64-linux-gnu-
    BUILD_END=$(date +"%s")
    DIFF=$((BUILD_END - BUILD_START))
    if [ -f $kernelDir/out/arch/$ARCH/boot/Image.gz-dtb ];then
        cp -af $kernelDir/out/arch/$ARCH/boot/Image.gz-dtb $AnykernelDir
        KName=$(cat "$(pwd)/arch/arm64/configs/begonia_user_defconfig" | grep "CONFIG_LOCALVERSION=" | sed 's/CONFIG_LOCALVERSION="-*//g' | sed 's/"*//g' )
        if [ $TypeBuild == "Stable" ];then
            ZipName="[$TypeBuildTag][$CODENAME]$KVer-$KName-$HeadCommitId.zip"
        else
            ZipName="[$TypeBuildTag][$TypeBuild][$CODENAME]$KVer-$KName-$HeadCommitId.zip"
        fi
        MakeZip
    else
        tg_send_info "<b>❌ Build failed [$((DIFF / 60)):$((DIFF % 60))]</b>%0Asad"
        exit -1
    fi
}

MakeZip(){
    cd $AnykernelDir
    if [ ! -z "$spectrumFile" ];then
        cp -af $SpectrumDir/$spectrumFile init.spectrum.rc && sed -i "s/persist.spectrum.kernel.*/persist.spectrum.kernel $KName/g" init.spectrum.rc
    fi
    cp -af anykernel-real.sh anykernel.sh && sed -i "s/kernel.string=.*/kernel.string=$KName-$HeadCommitId by ZyCromerZ/g" anykernel.sh

    zip -r9 "$ZipName" * -x .git README.md anykernel-real.sh .gitignore *.zip
    tg_send_files

}
getInfo 'include main.sh success'