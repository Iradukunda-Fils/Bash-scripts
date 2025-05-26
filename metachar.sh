#!/bin/bash
# -------------------------------------
# Bash Tutorial: Special Characters and Symbols
# Created for teaching via YouTube
# -------------------------------------

# 1️⃣ Comment Symbol - Everything after '#' is ignored by the shell
# This line does nothing — just a comment.

echo "➡️  1. This is a regular echo command."  # Inline comment after code

# 2️⃣ Shebang (#!) - tells the system which interpreter to use
# Already defined at the top: #!/bin/bash

# 3️⃣ Variable and Value Reference with $
name="Ghost"
echo "➡️  2. Hello, $name"

# Using ${} for clarity when combining with text
file="report"
echo "➡️  3. File name: ${file}.txt"

# 4️⃣ Command Substitution: $(...)
current_date=$(date)
echo "➡️  4. Current date is: $current_date"

# 5️⃣ Negation using ! in conditions
echo "➡️  5. Testing negation:"
if [ ! -f "ghost.txt" ]; then
  echo "  🔎 'ghost.txt' does NOT exist"
fi

# 6️⃣ Globbing: *, ?, []
echo "➡️  6. Matching files:"
touch file1.txt file2.txt fileA.txt
echo "  * All .txt files: $(ls *.txt)"
echo "  ? Matches one character: $(ls file?.txt)"
echo "  [] Matches specific chars: $(ls file[12].txt)"

# 7️⃣ Logical Operators: &&, ||, ;
echo "➡️  7. Logical Operators:"
mkdir test_dir && echo "  ✅ test_dir created"
mkdir test_dir || echo "  ❌ Already exists"
echo "  👋 Hello"; echo "  🌍 World"  # runs both always

# 8️⃣ Test with [ ]
echo "➡️  8. Numeric comparison:"
a=5
b=10
if [ $a -lt $b ]; then
  echo "  $a is less than $b"
fi

# 9️⃣ Redirections: >, >>, 2>, &>
echo "➡️  9. Redirection Examples:"
echo "First line" > output.txt
echo "Second line" >> output.txt
ls notfound 2> error.log
echo "Both stdout and stderr" &> both.log

# 1️⃣0️⃣ Grouping Commands
echo "➡️  10. Grouping:"
{ echo "Grouped A"; echo "Grouped B"; } > group.txt

# Subshell
echo "➡️  11. Subshell:"
(pwd; echo "Inside subshell")

# 1️⃣1️⃣ Brace Expansion
echo "➡️  12. Brace Expansion:"
echo file{A,B,C}.txt  # fileA.txt fileB.txt fileC.txt

# 1️⃣2️⃣ Array Length and Pattern Removal
filename="archive_backup_2024.zip"
echo "➡️  13. Length of string: ${#filename}"
echo "Remove prefix: ${filename#archive_}"
echo "Remove suffix: ${filename%.zip}"

# 1️⃣3️⃣ Positional Parameters and Special Variables
echo "➡️  14. Special variables:"

echo "Script name: $0"
echo "1st arg: $1"
echo "All args: $@"
echo "Number of args: $#"
echo "Exit code of last command: $?"

# 1️⃣4️⃣ Color Output
echo -e "\e[32m✅ Success message\e[0m"
echo -e "\e[31m❌ Error message\e[0m"

# Cleanup
rm file1.txt file2.txt fileA.txt group.txt output.txt error.log both.log
rmdir test_dir

echo "🎓 Bash symbols tutorial completed!"
