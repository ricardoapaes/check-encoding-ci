#!/bin/bash

FILES=$( find \( -name '*.php' -o -name '*.css' -o -name '*.js' -o -name '*.jsx' -o -name '*.tpl' -o -name '*.ts' -o -name '*.tsx' \) -not \( -path "./service/vendor/*" -o -path "./static/node_modules/*" -o -path "./build/*" -o -path "./static/build/*" -o -path "./temp/*" \));

for f in ${FILES}
do
  if [ -d "$f" ]; then
    continue
  fi

  error=$(grep -axv '.*' $f)
  echo "Checking ${f}";
  if [ -n "$error" ]; then
    echo "An error occurred converting to UTF-8"
    echo ""
    echo "${error}";
    exit 1;
  fi
done