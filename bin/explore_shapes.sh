#!/bin/bash

# shows up fields of shape files, useful for building db models
#

ogrinfo -so $1
echo "which layer? "
read LAYER
ogrinfo -so $1 $LAYER

