#!/bin/bash

# [....], [[ ... ]]

#   ((   )), $(( )) 

#n=$(( 0 ));

 #echo "$n"

#if (( 0 )); then
 #   echo " $n is passed..!"
#else
#    echo "Not passed $(( 2**3 ))"
#fi









#relational operators

# -gt, -lt, -le, -ge, -eq , -ne, 

#name=323

#if [[ name -le 32 ]]; then 
 #  echo "the scripts pass"

#else 
 # echo "dont match..?"

#fi


#logical operators

# &&, &, !, ||, `

#number=2
#n=2


#if [[ number -le n && number -eq n ]]; then 
 #  echo "scripts pass"
#else 
 #  echo "not pass"

#fi

#String Operators

# =, !=, -z, -n, >, <,  <=,

str="hello"
#s="hello"
s="world"

#if [[ "A" > "a" ]]; then 
 #  echo "scripts pass"
#else 
 #  echo "not pass"

#fi


#Files operators

# -e, -f, -d, -r, -w, -x

dir=$(sudo pwd)

touch "$dir/io.pdf"

file="$dir/io.pdf"

dir="/home/nonedir/"



if [[ -w  $file ]]; then 
   echo "scripts pass"
else 
   echo "not pass"

fi
