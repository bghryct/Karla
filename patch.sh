#!/bin/sh
# this small script will be incorporated into build as soon as it is ready.
# the purpose of this script is to patch the faulty Karla-Italic-VF.ttf in fonts/variable
# the patch does this by taking an already fixed name table from the offending file and merging it 
# back into and replacing the current name table in Karla-Italic-VF.ttf
# I am unsure why this fix is necessary as fontmake should just output the correct name table from the glyphs source
echo "name table patch begin"
# copies the 'name' table patch into the variable outputs folder
cp ./patch/Karla-Italic-VF.ttx ./fonts/variable/Karla-Italic-VF.ttx
echo "copy done"
# change dir to variable fonts directory
cd fonts/variable/

# Merge the patch into the fontmake version of Karla-Italic-VF.ttf
ttx -m Karla-Italic.ttf Karla-Italic-VF.ttx

# Remove the rotten file
rm -rf Karla-Italic.ttf

# Rename the corrected file
mv Karla-Italic-VF.ttf Karla-Italic.ttf  

# Remove the patch file
rm -rf Karla-Italic-VF.ttx

echo "name table patch complete"
echo "os/2 table patch begin"

cd ..
cd ..

# copies the 'OS_2' table patch into the variable outputs folder
cp ./patch/Karla-Italic_OS2.ttx ./fonts/variable/Karla-Italic_OS2.ttx

# change dir to variable fonts directory
cd fonts/variable
# Merge the 'OS_2' patch into the fontmake version of Karla-Italic-VF.ttf
ttx -m Karla-Italic.ttf Karla-Italic_OS2.ttx

# Remove the rotten file
rm -rf Karla-Italic.ttf

# Rename the corrected file
mv Karla-Italic_OS2.ttf Karla-Italic.ttf

# Remove the patch file
rm -rf Karla-Italic_OS2.ttx

echo "os/2 table patch complete"
echo "You should now be left with a clean variable directory"


echo "os/2 table static patch begin"


