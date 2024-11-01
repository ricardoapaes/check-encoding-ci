#!/bin/bash
for f in $(find -not -path "./vendor/*")
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