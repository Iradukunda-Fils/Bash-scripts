#!/bin/bash
# Bash Scripting: Teaching Loops, Conditions, and Functions using mapfile and Dash Operators

# -----------------------------------------
# SECTION 1: Arrays using `mapfile`
# -----------------------------------------

# Read all files/folders in the current directory into an array using mapfile
readarray -t items < <(ls -1)

# Display the array
echo "📦 Items in the current directory:"
for item in "${items[@]}"; do
  echo " - $item"
done
echo

# -----------------------------------------
# SECTION 2: IF conditions with -z (empty) and -n (not empty)
# -----------------------------------------

echo "🔍 Checking if 6th item is available..."
if [[ -z "${items[5]}" ]]; then
  echo "❌ 6th item does not exist (array index 5 is empty)."
else
  echo "✅ 6th item is: ${items[5]}"
fi
echo

# -----------------------------------------
# SECTION 3: Numeric conditionals with -eq, -ne, -lt, -gt
# -----------------------------------------

file_count=${#items[@]}

echo "🔢 Total items in current directory: $file_count"
if [[ $file_count -eq 0 ]]; then
  echo "⚠️  Directory is empty."
elif [[ $file_count -lt 5 ]]; then
  echo "📁 Less than 5 items found."
elif [[ $file_count -gt 10 ]]; then
  echo "📁 More than 10 items found."
else
  echo "📁 Directory has a moderate number of items."
fi
echo


# -----------------------------------------
# SECTION 4: For loop with C-style syntax
# -----------------------------------------

echo "🔁 Displaying first 3 items using C-style for loop:"
for (( i=0; i<3; i++ )); do
  echo "[$i] ${items[$i]}"
done
echo

# -----------------------------------------
# SECTION 5: While loop — count down from 5
# -----------------------------------------

counter=5
echo "⏳ Countdown using while loop:"
while [[ $counter -gt 0 ]]; do
  echo "$counter..."
  ((counter--))
  sleep 0.5
done
echo "🚀 Blast off!"
echo

# -----------------------------------------
# SECTION 6: Until loop — wait for a file to appear
# -----------------------------------------

target="target.txt"
echo "⏳ Waiting for file: $target"
until [[ -f "$target" ]]; do
  echo "Waiting for $target to be created..."
  sleep 1
done
echo "✅ Found $target!"
echo

# -----------------------------------------
# SECTION 7: Looping over only files (excluding dirs)
# -----------------------------------------

echo "📂 Files only in the directory:"
mapfile -t only_files < <(find . -maxdepth 1 -type f -printf '%f\n')
for file in "${only_files[@]}"; do
  echo "📄 $file"
done
echo

# -----------------------------------------
# SECTION 8: Function Example #1 — Even or Odd
# -----------------------------------------

check_even_or_odd() {
  local number=$1
  if (( number % 2 == 0 )); then
    echo "🟢 $number is even."
  else
    echo "🔴 $number is odd."
  fi
}

echo "🔢 Testing check_even_or_odd function:"
for num in {1..5}; do
  check_even_or_odd "$num"
done
echo

# -----------------------------------------
# SECTION 9: Function Example #2 — Return value and arithmetic
# -----------------------------------------

add_numbers() {
  local a=$1
  local b=$2
  local result=$((a + b))
  return $result  # This returns via exit code (0-255)
}

echo "➕ Adding 4 + 6:"
add_numbers 4 6
sum=$?
echo "Result from function (via return code): $sum"
echo

# -----------------------------------------
# SECTION 10: Function Example #3 — With default parameters
# -----------------------------------------

greet_user() {
  local name="${1:-Guest}"  # Default to "Guest" if not provided
  echo "👋 Hello, $name!"
}

echo "🧑 Greeting examples:"
greet_user "Alice"
greet_user
echo

# -----------------------------------------
# SECTION 11: Function Example #4 — Process and filter array
# -----------------------------------------

print_large_files() {
  local size_threshold=$1  # in bytes
  echo "📦 Files larger than $size_threshold bytes:"
  for file in *; do
    if [[ -f "$file" ]]; then
      local size=$(stat -c%s "$file")
      if [[ $size -gt $size_threshold ]]; then
        echo "📁 $file - $size bytes"
      fi
    fi
  done
}

echo "📊 Filtering large files:"
print_large_files 1000
echo







