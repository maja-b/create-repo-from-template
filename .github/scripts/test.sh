#!/usr/bin/env bash
ignore_files=".git|.gitignore|customize.json|README.md"

for input_file in `tree -I "${ignore_files}" -Ffai --noreport`
do
  if [ ! -d "${input_file}" ]; then
    echo "Processing file: ${input_file}"
    gomplate --file "${input_file}" --out "${input_file}" --left-delim "<<[" --right-delim "]>>" -c var=customize.json
  fi
done
