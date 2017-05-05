#!/bin/bash
echo "start"
for gender in {M,F}; do  
  for letter in {A..Z}; do
    for filename in $(ls names/$gender/$letter/*-stats.txt); do
      name=$(echo ${filename} | sed -n 's/names\/[A-Z]\/[A-Z]\/\(.*\)-stats.txt/\1/p')
      year=$(tail ${filename} -n +2 | cut -f1 -d,)
      echo $name $year
      printf '%s\n' $NAME $YEAR >> name_ages.csv
    done
  done
done
echo "complete."
