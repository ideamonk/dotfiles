#!/bin/bash
ICOUNT="`echo $1 | grep \.svn | wc -c`"
if [ $ICOUNT = "0" ]; then 
  echo $1
else
  echo ""
fi

