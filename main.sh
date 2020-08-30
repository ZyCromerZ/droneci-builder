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
    git clone https://$GIT_SECRET@github.com/ZyCromerZ/begonia_kernel -b $branch $kernelDir --depth=1
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
    ChatID="-1001301538740"
    ARCH="arm64"
    TypeBuild="Stable"
    DEFFCONFIG="begonia_user_defconfig"
    TotalCores=$(nproc --all)
    export KBUILD_BUILD_USER="ZyCromerZ"
    export KBUILD_BUILD_HOST="DroneCI-server"
fi

CompileKernel(){
    cd $kernelDir
    rm -rf out
    make -j${TotalCores}  O=out ARCH="$ARCH" "$DEFFCONFIG"
    make -j${TotalCores}  O=out \
        PATH=$CLANG_DIR/bin:$GCC64_DIR/bin/:$GCC32_DIR/bin/:/usr/bin:$PATH \
        LD_LIBRARY_PATH="$CLANG_DIR/lib64:${LD_LIBRARY_PATH}" \
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
    cd $mainDir
}
getInfo 'include success'