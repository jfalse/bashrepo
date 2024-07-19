sysop@sysadmin03:~/assignments/scripting$ cat ./simple_shell.sh
#!/bin/bash

fn=$(ls -lh | awk '{print $9}')

if [ -n "$1" ]; then
        printf "\nArgs exist checking Args for filetype...\n---------------------------------------------------\n"
        if [ -d "$1" ]; then
                printf "%s is a directory\n\n" "$1"
        elif [ -f "$1" ]; then
                printf "%s is not a directory it is a Regular File\n\n" "$1"
        else
                printf "%s directory does not exist\n\n" "$1"
        fi
fi

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
