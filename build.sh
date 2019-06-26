#!/bin/sh

# -------------------------------------------------------------------
# UPDATE THIS VARIABLE ----------------------------------------------

# thisFont="Karla" # must match the name in the font file, e.g. FiraCode-VF.ttf needs the variable "FiraCode"

# -------------------------------------------------------------------
# Update the following as needed ------------------------------------
set -e


echo "Generating Static fonts"

mkdir -p ./fonts/ttf
mkdir -p ./fonts/variable

echo "Made font directories"
fontmake -g sources/Karla.glyphs -i --round-instances -o ttf --output-dir ./fonts/ttf/ 
echo "Made Roman ttfs"
fontmake -g sources/Karla-Italic.glyphs -i --round-instances -o ttf --output-dir ./fonts/ttf/
echo "Made Italic ttfs"

# fontmake -g sources/Karla-Roman.glyphs -i -o otf --output-dir ./fonts/otf/
# echo "Made Roman otfs"
# fontmake -g sources/Karla-Italic.glyphs -i -o otf --output-dir ./fonts/otf/
# echo "Made Italic otfs"

echo "Generating VFs"
# mkdir -p ./fonts/variable
fontmake -g sources/Karla.glyphs -o variable --round-instances --output-path ./fonts/variable/Karla.ttf
fontmake -g sources/Karla-Italic.glyphs -o variable --round-instances --output-path ./fonts/variable/Karla-Italic.ttf

echo "Removing Build UFOS"

rm -rf master_ufo/ instance_ufo/

echo "Build UFOS Removed"

echo "Post processing"

ttfs=$(ls fonts/ttf/*.ttf)
echo $ttfs
for ttf in $ttfs
do
	gftools fix-dsig -f $ttf;
	gftools fix-nonhinting $ttf "$ttf.fix";
	mv "$ttf.fix" $ttf;
done
echo "fixed nonhinting ttfs as well as DSIG"

rm ./fonts/ttf/*backup*.ttf

vfs=$(ls ./fonts/variable/*.ttf)
for vf in $vfs
do
	gftools fix-dsig -f $vf;
	gftools fix-nonhinting $vf "$vf.fix";
	mv "$vf.fix" $vf;
	ttx -f -x "MVAR" $vf; # Drop MVAR. Table has issue in DW
	rtrip=$(basename -s .ttf $vf)
	new_file=./fonts/variable/$rtrip.ttx;
	rm $vf;
	ttx $new_file
	rm ./fonts/variable/*.ttx
done
rm ./fonts/variable/*backup*.ttf

echo "fix vf meta? ok let's try that. I'm trying to fix VF meta"
gftools fix-vf-meta $vfs;
for vf in $vfs
do
	mv "$vf.fix" $vf;
done

echo "Post processing complete"



cp /Users/mirkovelimirovic/Documents/GitHub/Karla/fonts/OFL.txt /Users/mirkovelimirovic/Documents/GitHub/Karla/fonts/ttf/OFL.txt
cp /Users/mirkovelimirovic/Documents/GitHub/Karla/fonts/OFL.txt /Users/mirkovelimirovic/Documents/GitHub/Karla/fonts/variable/OFL.txt


##This is just to rename Variable Fonts for our naming convention as it's a broken check atm
# mv ./fonts/variable/Karla.ttf ./fonts/variable/Karla\[wght\].ttf
# mv ./fonts/variable/Karla-Italic.ttf ./fonts/variable/Karla-Italic\[wght\].ttf
