#!/bin/bash
FILES=/home/rick/Support/0227189/*.log
for f in $FILES
do
  echo "Processing $f file..."
  echo `grep --text 'Failed delivery' $f | awk '{print $1}' | cut -b 1-5 | uniq -c | sort -n`
done
