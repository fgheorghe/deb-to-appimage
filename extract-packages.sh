#!/bin/bash
cd $1

for FILE in *.deb;
do
    FILENAME="$(basename $FILE .deb)"
    mkdir -p ${FILENAME}
    cd ${FILENAME}
    ar x ../$FILE
    tar -xf data.tar.xz
    tar -xf data.tar.zst
    tar -zxvf data.tar.gz
    rm control.tar.*
    rm debian-binary
    rm data.tar.*
    cp -r ./ ../../$2
    cd ..
done

cd ..
