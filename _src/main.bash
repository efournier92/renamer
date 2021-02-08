#!/bin/bash

#----------------
# Name          : main.bash
# Description   : 
# Author        : E Fournier
# Dependencies  : 
#----------------

source "./_src/messages/help.bash"
source "./_src/utils/constants.bash"
source "./_src/args/verbose_args.bash"
source "./_src/args/mode_args.bash"
source "./_src/args/help_args.bash"
source "./_src/modes/sequence_mode.bash"

run_sequence_mode() {
  sequence `read_sequence_args "$@"`
}

main() {
  local is_verbose_enabled=`read_verbose_args "$@"`
  [[ "$is_verbose_enabled" == true ]] && VERBOSE=true

  local is_preview_enabled=`read_preview_args "$@"`
  [[ "$is_preview_enabled" == true ]] && PREVIEW=true
  
  local mode=`read_mode_args "$@"`
  read_help_args "$@"
  if [[ "$mode" == `sequence_mode_name` ]]; then
    run_sequence_mode "$@"
  else
    print_help_by_mode "$mode"
  fi
}

main "$@"

