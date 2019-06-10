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

cd ../karla
# # -------------------------------------------------------------------
# # move fonts --------------------------------------------------------

mkdir ../fonts/ofl/karla/variable

cp $KarlaIVF /Users/mirkovelimirovic/Documents/GitHub/fonts/ofl/karla/variable/Karla-Italic-VF.ttf   
cp $KarlaRVF /Users/mirkovelimirovic/Documents/GitHub/fonts/ofl/karla/variable/Karla-Roman-VF.ttf   
cp /Users/mirkovelimirovic/Documents/GitHub/Karla/fonts/variable/OFL.txt /Users/mirkovelimirovic/Documents/GitHub/fonts/ofl/karla/variable/OFL.txt  


mkdir ../fonts/ofl/karla/static

cp /Users/mirkovelimirovic/Documents/GitHub/Karla/fonts/ttf/OFL.txt /Users/mirkovelimirovic/Documents/GitHub/fonts/ofl/karla/static/OFL.txt  

statics=./fonts/ttf/*.ttf


for ttf in $statics
do
    cp $ttf /Users/mirkovelimirovic/Documents/GitHub/fonts/ofl/karla/static/$(basename $ttf)
done

## This functions correctly now. 

# gftools add-font --update ofl/karla # do this the first time, then edit and copy (Ask Stephen why doesn't this flag work?)


cp /Users/mirkovelimirovic/Documents/GitHub/Karla/fonts/METADATA.pb /Users/mirkovelimirovic/Documents/GitHub/fonts/ofl/karla/METADATA.pb

# cp $interDir/LICENSE.txt ofl/inter/OFL.txt
cp /Users/mirkovelimirovic/Documents/GitHub/Karla/fonts/OFL.txt  /Users/mirkovelimirovic/Documents/GitHub/fonts/ofl/karla/OFL.txt

cp /Users/mirkovelimirovic/Documents/GitHub/Karla/fonts/DESCRIPTION.en_us.html  /Users/mirkovelimirovic/Documents/GitHub/fonts/ofl/karla/DESCRIPTION.en_us.html
# cp $interQADir/gfonts-description.html ofl/inter/DESCRIPTION.en_us.html

rm -rf /Users/mirkovelimirovic/Documents/GitHub/fonts/ofl/karla/*ttf

# # -------------------------------------------------------------------
# # run checks, saving to inter/misc/googlefonts-qa/checks ------------

set +e # otherwise, the script stops after the first fontbakery check output

mkdir -p ./checks/static

cd /Users/mirkovelimirovic/Documents/GitHub/fonts/ofl/karla

ttfs=$(ls -R */*.ttf && ls *.ttf) # use this to statics and VFs
# ttfs=$(ls *.ttf) # use this to check only the VFs
# ttfs=$(ls -R */*.ttf ) # use this to check only statics

for ttf in $ttfs
do
    fontbakery check-googlefonts $ttf --ghmarkdown $interQADir/checks/${ttf/".ttf"/".checks.md"}
done
