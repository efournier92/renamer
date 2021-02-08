#!/bin/bash

#----------------
# Name          : read_mode_arg.bash
# Description   : Interprets general command arguments
#----------------

source "./_src/messages/logs.bash"
source "./_src/messages/errors.bash"
source "./_src/utils/modes.bash"

read_mode_args() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  
  while [[ "$1" != "" ]]; do
    case $1 in

      -m | --mode )
        shift
        local mode="$1"
        ;;

    esac
    shift
  done
 
  [[ -z "$mode" ]] && error_missing_required_arg "mode" "${FUNCNAME[0]}"
  [[ `is_mode_known "$mode"` == false ]] && error_mode_not_found "$mode" "${FUNCNAME[0]}"

  echo "$mode"
}


