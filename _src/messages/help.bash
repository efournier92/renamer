#!/bin/bash

#----------------
# Name          : help.bash
# Description   : Library of functions for printing help info
#----------------

help_header() {
cat << EOF
_____
SCANZ

EOF
}

help_general() {
cat << EOF
_______
GENERAL

  -h, --help [mode]    print help information [for mode]

  -m, --mode           enable mode [sequence]

  -v, --verbose        enable verbose debugging info

  -p, --preview        enable preview after scan
  
  USAGE: renamer -m sequence -h -v -p

EOF
}

help_sequence() {
cat << EOF
________
SEQUENCE

  -i, --scanner        scanner device for input

  -f, --format         format for scan

  -q, --quality        scan qualiter [150, 300, 600]

  -d, --output_dir     directory in which to save the capture

  -o, --output_name    name for the scanned file

  USAGE: renamer -m sequence -i jpg -o jpg -pr New_Name -si 1 -pad 3

EOF
}

print_help_sequence() {
  help_header
  help_sequence
}

print_help_all() {
  help_header
  help_general
  help_sequence
}

print_help_by_mode() {
  local mode="$1"
  
  if [[ "$mode" == `sequence_mode_name` ]]; then
    print_help_sequence
  else
    print_help_all
  fi
}

