#!/bin/bash

dataMountPoint='/mnt/data'

dirs=(Documents Downloads Music Pictures Videos)
for i in "${dirs[@]}"
do
    #echo $i
    rm -r $i
    ln -s $dataMountPoint/$i 
done




