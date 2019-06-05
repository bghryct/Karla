#!/bin/sh

# -------------------------------------------------------------------
# UPDATE THIS VARIABLE ----------------------------------------------

thisFont="Karla" # must match the name in the font file, e.g. FiraCode-VF.ttf needs the variable "FiraCode"

# -------------------------------------------------------------------
# Update the following as needed ------------------------------------
set -e
source venv/bin/activate
echo "I should have activated a virtual environment now"

pip list
# echo "Generating Static fonts"

# mkdir -p ./fonts/ttf
# mkdir -p ./fonts/otf
# mkdir -p ./fonts/variable

# echo "Made font directories"
# fontmake -g sources/Karla-Roman.glyphs -i -o ttf --output-dir ./fonts/ttf/
# echo "Made Roman ttfs"
# fontmake -g sources/Karla-Italic.glyphs -i -o ttf --output-dir ./fonts/ttf/
# echo "Made Italic ttfs"

# fontmake -g sources/Karla-Roman.glyphs -i -o otf --output-dir ./fonts/otf/
# echo "Made Roman otfs"
# fontmake -g sources/Karla-Italic.glyphs -i -o otf --output-dir ./fonts/otf/
# echo "Made Italic otfs"

# echo "Generating VFs"
# mkdir -p ./fonts/variable
# fontmake -g sources/Karla-Roman.glyphs -o variable --output-path ./fonts/variable/Karla-Roman-VF.ttf
# fontmake -g sources/Karla-Italic.glyphs -o variable --output-path ./fonts/variable/Karla-Italic-VF.ttf

# echo "Removing Build UFOS"

# rm -rf master_ufo/ instance_ufo/

# echo "Build UFOS Removed"

# echo "Post processing"

# ttfs=$(ls fonts/ttf/*.ttf)
# echo $ttfs
# for ttf in $ttfs
# do
# 	gftools fix-dsig -f $ttf;
# 	gftools fix-nonhinting $ttf "$ttf.fix";
# 	mv "$ttf.fix" $ttf;
# done
# rm /fonts/ttf/*backup*.ttf
 
# echo "yakshaved ttf backup removed"

# # vfs=$(ls ./fonts/variable/*.ttf)
# # for vf in $vfs
# # do
# # 	gftools fix-dsig -f $vf;
# # 	gftools fix-nonhinting $vf "$vf.fix";
# # 	mv "$vf.fix" $vf;
# # 	ttx -f -x "MVAR" $vf; # Drop MVAR. Table has issue in DW
# # 	rtrip=$(basename -s .ttf $vf)
# # 	new_file=./fonts/variable/$rtrip.ttx;
# # 	rm $vf;
# # 	ttx $new_file
# # 	rm /fonts/variable/*.ttx
# # done
# # rm /fonts/variable/*backup*.ttf

# # gftools fix-vf-meta $vfs;
# # for vf in $vfs
# # do
# # 	mv "$vf.fix" $vf;
# # done

# # echo "Post processing complete"

# # # cd ..

# # # # ============================================================================
# # # # Autohinting ================================================================

# # statics=$(ls ./fonts/ttf/*.ttf)
# # echo hello
# # for file in $statics; do 
# #     echo "fix DSIG in " ${file}
# #     gftools fix-dsig --autofix ${file}


# #     echo "TTFautohint " ${file}
# #     # autohint with detailed info
# #     hintedFile=${file/".ttf"/"-hinted.ttf"}
# #     ttfautohint -I ${file} ${hintedFile} 
# #     cp ${hintedFile} ${file}
# #     rm -rf ${hintedFile}
# # done

# # # # ============================================================================
# # # # Fix Hinting ================================================================

# # statics=$(ls ./fonts/ttf/*.ttf)
# # echo "Hi Mirko I am trying to fix the hinting in the statics"
# # for file in $statics; do 
# # 	echo "fix hinting in " ${file}
# # 	# fix hinting 
# #     gftools fix-hinting ${file} 
# #  done


# # 	echo "rm rfing ttfs"
# # 	rm -rf fonts/ttf/*.ttf
# # 	echo "ttfs removed"


# #   # Rename all *.ttf.fix to *.ttf                                                                 
# # for f in ./fonts/ttf/*.ttf.fix; do 
# #     mv -- "$f" "${f%.ttf.fix}.ttf"     
# # done



# # # # Build woff2 fonts ==========================================================

# # # # requires https://github.com/bramstein/homebrew-webfonttools

# # # rm -rf fonts/woff2

# # ttfs=$(ls ./fonts/*/*.ttf)
# # for ttf in $ttfs; do
# #     woff2_compress $ttf
# # done

# # mkdir -p fonts/woff2
# # woff2s=$(ls ./fonts/*/*.woff2)
# # for woff2 in $woff2s; do
# #     mv $woff2 fonts/woff2/$(basename $woff2)
# # done
# # # # ============================================================================
# # # # Build woff fonts ==========================================================

# # # # requires https://github.com/bramstein/homebrew-webfonttools

# # # rm -rf fonts/woff

# # ttfs=$(ls ./fonts/*/*.ttf)
# # for ttf in $ttfs; do
# #     sfnt2woff-zopfli $ttf
# # done

# # mkdir -p fonts/woff
# # woffs=$(ls ./fonts/*/*.woff)
# # for woff in $woffs; do
# #     mv $woff fonts/woff/$(basename $woff)
# # done