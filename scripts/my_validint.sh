#!/bin/bash

validint()
{
   number="$1"; min="$2"; max="$3"

   if [ -z $number ]; then
      echo "You didn't enter anything. Please enter a number." >&2
      return 1
   fi

   # query : first word start "-" ? 
   if [ "${number%${number#?}}" = "-" ]; then
      testvalue="${number#?}" # Grab all but the first charater go test
   else
      testvalue="$number"
   fi

   nodigits="$(echo $testvalue | sed 's/[[:digit:]]//g')"
   
   if [ ! -z $nodigits ]; then
      echo "Invalid number format !" >&2
      return 1
   fi
   if [ ! -z $min ] && [ "$number" -lt "$min" ] ; then
      echo "Your value is too small min value is $min " >$2
      return 1
   fi
   
   if [ ! -z $max ] && [ "$number" -gt "$max" ]; then
      echo "Your value is too big max value is $max " >&2
      return 1
   fi
   return 0
}

if validint "$1" "$2" "$3" ; then
   echo "Input is a valid"
fi
