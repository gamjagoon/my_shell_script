#!/bin/bash

validAlphaNum()
{
   # all input Alpabet or number return 0
   # else return 1

   # remove all other charector
   validchars="$(echo $1 | sed -e 's/[^[:alnum:]]//g')"

   if [ "$validchars" = "$1" ]; then
      return 0
   else
      return 1
   fi
}

# main script 

/bin/echo -n "Enter input : "
read input

if ! validAlphaNum "$input" ; then
   echo "Please enter only letters and numbers" >&2
   exit 1
else
   echo "Input is valid"
fi

exit 0
