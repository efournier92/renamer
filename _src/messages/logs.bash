#!/bin/bash

#----------------
# Name          : logs.bash
# Description   : Library of functions for printing info logs in verbose mode
#----------------

source "./_src/utils/time.bash"
source "./_src/utils/constants.bash"

log_arguments() {
  echo "FUNCTION: $@" >&2
}

