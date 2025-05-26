#!/bin/bash

set_value() {
  local -n alias=$1  # Create a nameref to the variable passed as $1
  alias="🌟 Hello from nameref!"
}

greeting=""         # Original variable
set_value greeting  # Pass the variable name (not value)

echo "$greeting"    # Output: 🌟 Hello from nameref!



print_array() {
  local -n arr=$1
  for item in "${arr[@]}"; do
    echo "🔹 $item"
  done
}

my_data=("apple" "banana" "kiwi")
print_array my_data


declare -A capitals
capitals[France]="Paris"
capitals[Japan]="Tokyo"
capitals[Rwanda]="Kigali"

echo "🇫🇷 Capital of France: ${capitals[France]}"


for country in "${!capitals[@]}"; do
  echo "🌍 $country ➡️ ${capitals[$country]}"
done


print_dictionary() {
  local -n dict=$1
  for key in "${!dict[@]}"; do
    echo "$key => ${dict[$key]}"
  done
}

declare -A user_info=(
  [name]="Alice"
  [email]="alice@example.com"
  [role]="admin"
)

print_dictionary user_info
