#!/bin/bash

# Define a function using the preferred syntax
say_hello() {
  echo "👋 Hello from inside the function!"
}

# Call the function
say_hello

# Function that takes two arguments
greet_user() {
  echo "🙋 Hello $1, you're $2 years old!"
}

# Call with arguments
greet_user "Alice" 30


# Function that returns status code
is_even() {
  local num=$1
  if (( num % 2 == 0 )); then
    return 0  # success
  else
    return 1  # failure
  fi
}

# Call the function
is_even 9

# Check return status
if [[ $? -eq 0 ]]; then
  echo "✅ Number is even"
else
  echo "❌ Number is odd"
fi


# Outputs a computed result
square() {
  local x=$1
  echo $(( x * x ))  # outputs result, not return
}

result=$(square 5)
echo "🧮 Square is: $result"



# Function that prints all file names in current dir
list_files() {
  local i=1
  for file in *; do
    echo "$i. $file"
    ((i++))
  done
}

list_files


# Function that checks if a file exists
check_file() {
  local file=$1
  if [[ -f "$file" ]]; then
    echo "✅ $file exists."
  else
    echo "❌ $file not found."
  fi
}

check_file "myfile.txt"


# Function to print only .sh files
print_shell_scripts() {
  local files=(*)
  echo "📜 Shell scripts in this folder:"
  for file in "${files[@]}"; do
    if [[ "$file" == *.sh ]]; then
      echo " - $file"
    fi
  done
}

print_shell_scripts


say_hi() {
  echo "Hi there!"
}

say_bye() {
  echo "Goodbye!"
}

main() {
  say_hi
  say_bye
}

main  # Entrypoint


show_scopes() {
  local name="LocalName"
  echo "Inside function: $name"
}

name="GlobalName"
show_scopes
echo "Outside function: $name"


# Use mapfile to read directory contents into array
filter_large_files() {
  local size_limit=$1
  mapfile -t files < <(ls)

  echo "📦 Files larger than $size_limit bytes:"
  for f in "${files[@]}"; do
    if [[ -f "$f" ]]; then
      local size=$(stat -c%s "$f")
      if (( size > size_limit )); then
        echo "$f - $size bytes"
      fi
    fi
  done
}

filter_large_files 1000

