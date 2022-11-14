
ignore_files=".git|.github|.gtignore|customize.json|README.md"

for input_file in `tree -I "${ignore_files}" -Ffai --noreport`
do
  if [ ! -d "${input_file}" ]; then
    echo "Processing file: ${input_file}"
    gomplate \
         -f "${input_file}" \
         -o "${input_file}" \
         --left-delim "<<[" \
         --right-delim "]>>" \
         -c var=./github/scripts/customize.json
  fi
done

# Clean up / implode
# rm README.md
# rm customize
