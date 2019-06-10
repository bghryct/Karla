#!/bin/bash

##Post processing for Karla Italic VF

#### this script runs the post production necessary on the VF build of Karla Italic
#### Install requirements with `pip install -U -r sources/requirements.txt`
#### 
####
####
####
####
####
####
####
####
KIVF=./fonts/Karla-Italic-VF.ttf

gftools fix-dsig $KIVF --autofix


fix-nonhinting $KIVF ${KIVF.fix}

