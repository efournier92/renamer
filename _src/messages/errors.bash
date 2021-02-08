#!/bin/bash

#----------------
# Name          : errors.bash
# Description   : Library of functions for throwing runtime errors
#----------------

error_missing_function_args() {
  echo "ERROR: Arguments missing from called function [$@]"

  exit
}

error_missing_required_arg() {
  echo "ERROR: required argument not found [$@]"

  exit
}

error_file_not_found() {
  echo "ERROR: input file not found [$@]"

  exit
}

error_dir_not_found() {
  echo "ERROR: directory not found [$@]"

  exit
}

error_device_not_found() {
  echo "ERROR: Device not found in function [$@]"

  exit
}

error_mode_not_found() {
  echo "ERROR: Mode not found [$@]"

  exit
}

error_pdf_file_not_found() {
  echo "ERROR: PDF file not found [$@]"

  exit
}

