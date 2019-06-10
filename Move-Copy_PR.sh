#!/bin/sh


KarlaRVF=./fonts/variable/Karla-Roman-VF.ttf
KarlaIVF=./fonts/variable/Karla-Italic-VF.ttf

# this is a small script that should be included in a more correct build script at the end. 
# For the purposes of breaking it down into understandable steps I've included just these steps here
#


cd ../fonts/
git checkout master
git pull upstream master
git reset --hard
git checkout -B Karla
git clean -f -d


# # -------------------------------------------------------------------
# # move fonts --------------------------------------------------------

mkdir ../fonts/ofl/karla/variable

cp $KarlaIVF /Users/mirkovelimirovic/Documents/GitHub/fonts/ofl/karla/variable/Karla-Italic-VF.ttf   
cp $KarlaRVF /Users/mirkovelimirovic/Documents/GitHub/fonts/ofl/karla/variable/Karla-Roman-VF.ttf   


mkdir ../fonts/ofl/karla/static

statics=$(ls /build/fonts/const-hinted/*.ttf)
for ttf in $statics
do
    cp $ttf ofl/karla/static/$(basename $ttf)
done
