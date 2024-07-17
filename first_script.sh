#!/bin/bash

fn=$(ls -lh | awk '{print $9}')

printf "%-20s %-10s %-15s\n" "Filename" "lines" "Type"
printf "%-20s %-10s %-15s\n" "----------" "------" "-----------"

for file in $fn;
do
        if [ -f "$file" ]; then
                ln=$(wc -l "$file" | cut -d " " -f 1)
                printf "%-20s %-10s %-15s\n" "$file" "$ln" "Regular File"
        elif [ -d "$file" ]; then
                printf "%-20s %-10s %-15s\n" "$file" "N/A" "Directory file"
        else
                :
        fi
done
