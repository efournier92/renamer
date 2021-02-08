#!/bin/bash

#----------------
# Name          : doc_args.bash
# Description   : Interprets command arguments for doc mode
#----------------

source "./_src/input/user_select.bash"
source "./_src/utils/constants.bash"
source "./_src/utils/fs.bash"
source "./_src/utils/time.bash"
source "./_src/messages/logs.bash"
source "./_src/messages/errors.bash"

read_sequence_args() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"

  while [[ "$1" != "" ]]; do
    case $1 in

      -i | --ext_in )
        shift
        local ext_in="$1"
        ;;

      -o | --ext_out )
        shift
        local ext_out="$1"
        ;;

      -pr | --prefix )
        shift
        local prefix="$1"
        ;;

      -si | --starting_index )
        shift
        local starting_index="$1"
        ;;

    esac
    shift
  done
  
  [[ -z "$prefix" ]] && error_missing_required_arg "prefix"
  [[ -z "$ext_in" ]] && error_missing_required_arg "ext_in"
  [[ -z "$ext_out" ]] && local ext_out="$ext_in"
  [[ -z "$starting_index" ]] && local starting_index=0

  echo "$prefix" "$ext_in" "$ext_out" "$starting_index"
}

