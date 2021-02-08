#!/bin/bash

#----------------
# Name          : read_preview_arg.bash
# Description   : 
#----------------

source "./_src/messages/logs.bash"
source "./_src/messages/errors.bash"
source "./_src/utils/modes.bash"

read_preview_args() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"

  while [[ "$1" != "" ]]; do
    case $1 in

      -p | --preview )
        local is_preview_enabled="true"
        ;;

    esac
    shift
  done
 
  [[ -z "$is_preview_enabled" ]] && local is_preview_enabled="false"

  echo "$is_preview_enabled"
}


