#!/bin/zsh

script_path=$(pwd)/scripts/ flag=0
echo "this folder PATH is $script_path"
oldIFS=$IFS IFS=":"
for dir in $PATH ; do
   if [ "$dir" = "$script_path" ] ;then
      flag=1
   fi
done
IFS=$oldIFS

if [ $flag -eq 0 ]; then
   echo "ADD PATH"
   echo "export PATH="$(pwd)/scripts:\$PATH"" >> $HOME/.zshrc
else
   echo "PATH exist"
fi

source $HOME/.zshrc

echo 'change mode in $DIR/scripts'
chmod -R 755 ./scripts
