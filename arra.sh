declare -a arr=("apple" "banana" "cherry" "apple")

echo "${#arr[@]}"

for el in "${arr[@]}"; do
  if [[ "$el" == "cherry" ]]; then
   continue;
  fi
  echo "element is: $el"
done
 

echo

counter=0;

while [[ $counter -le 5 ]]; do
  echo  "counter is: $counter";
  ((counter++));
done 
c=0

until [[ $c -eq 5 ]]; do
echo "c value is: $c"
sleep 0.5
((c++))
done




