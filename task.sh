#!/bin/bash


echo "the number of the args is: $#"
echo "Great Your name is: $1"


read -p "Enter name of directory" dir

mkdir  -p ./"$dir"

echo "directory $dir created successful"

read -p "Ener name of the file to create: " file


touch ./"$file"


echo "file $file created successfull"

cd "$dir"


