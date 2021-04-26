#!/bin/bash
# inpath -- find program in $PATH 

in_path()
{
   # if find return 0 == program exist
   # else return 1 == program not exist

   cmd=$1 ourpath=$2 result=1
   oldIFS=$IFS IFS=":"

   for directory in $ourpath; do
      if [ -x $directory/$cmd ]; then
         result=0
      fi
   done
   
   IFS=$oldIFS
   return $result
}

checkForCmdInPath()
{
   var=$1
   if [ "$var" != "" ]; then
      if [ "${var:0:1}" = "/" ]; then
         if [ ! -x $var ]; then
            return 1
         fi 
      elif ! in_path $var $PATH ; then
         return 2
      fi
      else echo "return"
   fi
}

if [ $# -ne 1 ]; then
   echo "Usage: $0 command" >&2
   exit 1
fi

echo "your argument is [$1]"

checkForCmdInPath "$1"
case $? in
   0)
      echo "$1 found in PATH"
      ;;
   1)
      echo "$1 not found or not excutable"
      ;;
   2)
      echo "$1 not found in PATH"
      ;;
esac

echo "===============================================
end script
==============================================="

exit 0


