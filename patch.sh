#!/bin/sh
# this small script will be incorporated into build as soon as it is ready.
# the purpose of this script is to patch the faulty Karla-Italic-VF.ttf in fonts/variable
# the patch does this by taking an already fixed name table from the offending file and merging it 
# back into and replacing the current name table in Karla-Italic-VF.ttf
# I am unsure why this fix is necessary as fontmake should just output the correct name table from the glyphs source
echo "name table patch begin"
# copies the 'name' table patch into the variable outputs folder
cp /Users/mirkovelimirovic/Documents/GitHub/Karla/patch/Karla-Italic-VF.ttx /Users/mirkovelimirovic/Documents/GitHub/Karla/fonts/variable/Karla-Italic-VF.ttx

# change dir to variable fonts directory
cd fonts/variable/

# Merge the patch into the fontmake version of Karla-Italic-VF.ttf
ttx -m Karla-Italic-VF.ttf Karla-Italic-VF.ttx

# Remove the rotten file
rm -rf Karla-Italic-VF.ttf

# Rename the corrected file
mv Karla-Italic-VF#1.ttf Karla-Italic-VF.ttf  

# Remove the patch file
rm -rf Karla-Italic-VF.ttx

echo "name table patch complete"
echo "os/2 table patch begin"

# copies the 'OS_2' table patch into the variable outputs folder
cp /Users/mirkovelimirovic/Documents/GitHub/Karla/patch/Karla-Italic-VF-OS_2.ttx /Users/mirkovelimirovic/Documents/GitHub/Karla/fonts/variable/Karla-Italic-VF-OS_2.ttx

# Merge the 'OS_2' patch into the fontmake version of Karla-Italic-VF.ttf
ttx -m Karla-Italic-VF.ttf Karla-Italic-VF-OS_2.ttx

# Remove the rotten file
rm -rf Karla-Italic-VF.ttf

# Rename the corrected file
mv Karla-Italic-VF-OS_2.ttf Karla-Italic-VF.ttf

# Remove the patch file
rm -rf Karla-Italic-VF-OS_2.ttx 

echo "os/2 table patch complete"
echo "You should now be left with a clean variable directory"