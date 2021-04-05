#!/bin/bash

increment() {
  local index=$1

  echo $(( index + 1 ))
}

pad() {
  local index="$1"
  local padding_zeros="$2"

  echo `printf "%03d" $index`
}

rename_file() {
  local input_file="$1"
  local output_file="$2"
  
  if [[ ! -f "$input_file" ]]; then
    echo "ERROR: File $input_file does not exist."
  elif [[ -f "$output_file" ]]; then
    echo "ERROR: File $output_file already exists."
  else
    echo "MOVING: $input_file >> $output_file" >&2
    mv "$input_file" "$output_file"
  fi
}

preview_file() {
  local input_file="$1"
  local output_file="$2"

  echo "PREVIEW: $input_file >> $output_file" >&2
}

rename() {
  local prefix="$1"
  local ext_in="$2"
  local ext_out="$3"
  local index="$4"
  local padding_zeros="$5"

  for input_file in *.$ext_in; do
    local index_padded=`pad $index "$padding_zeros"`
    local output_file="${prefix}_${index_padded}.${ext_out}"

    [[ "$PREVIEW" == "true" ]] \
      && preview_file "$input_file" "$output_file" \
      || rename_file "$input_file" "$output_file"

    index=`increment $index`
  done
}

preview_all() {
  local prefix="$1"
  local ext_in="$2"
  local ext_out="$3"
  local index="$4"

  rename "$prefix" "$ext_in" "$ext_out" "$index" "true"
}

rename_all() {
  local prefix="$1"
  local ext_in="$2"
  local ext_out="$3"
  local index="$4"
  local padding_zeros="$5"

  # Rename sequence to temp files to avoid overwriting duplicates
  rename "${prefix}_TMP" "$ext_in" "$ext_in" "$index" "$padding_zeros"

  # Rename sequence to final file names
  rename "${prefix}" "$ext_in" "$ext_out" "$index" "$padding_zeros"
}

sequence() {
  local prefix="$1"
  local ext_in="$2"
  local ext_out="$3"
  local starting_index="$4"
  local padding_zeros="$5"
  
  [[ -z "$starting_index" ]] && local starting_index=0
  [[ -z "$padding_zeros" ]] && local padding_zeros=3

  [[ "$PREVIEW" == "true" ]] \
    && preview_all "$prefix" "$ext_in" "$ext_out" "$starting_index" "$padding_zeros" \
    || rename_all "$prefix" "$ext_in" "$ext_out" "$starting_index" "$padding_zeros"
}

