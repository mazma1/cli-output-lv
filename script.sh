#!/usr/bin/env bash

# exit when a command fails
set -o errexit

# show all commands being executed
set -o xtrace

# exit if previous command returns a non 0 status
set -o pipefail 

create_directories() {
  mkdir -p test
  cd test
}

# save output to a file
redirect_output_to_file() {
  which bash > test.txt
}

# read input from a file
redirect_file_to_input() {
  cat < test.txt
}

copy_file() {
  touch copy.txt
  cp test.txt copy.txt
}

list_directory_content() {
  cd ..
  ls -lh test
}

move_to_directory() {
  mkdir src
  mv test/copy.txt src
}

# send the output of a command as input to another command
list_three_files() {
  ls | head -3
}

# execute above commands
main() {
  create_directories
  redirect_output_to_file
  redirect_file_to_input
  copy_file
  list_directory_content
  move_to_directory
  list_three_files
}

main "$@";
