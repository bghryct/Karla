For whatever reason 
gftools fix-vfmeta is not working to correct 
Karla-Italic-VF.ttf's name table 

Therefore I've created a patch file that is the name table and only the name table corrected for FB checks

Karla-Italic-VF.ttx

Usage

To use 

ttx -m Karla-Italic-VF.ttf Karla-Italic-VF.ttx

where both files are in the same directory 