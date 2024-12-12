#!/bin/bash

mkdir cinco

for i in {1..5}; do
   mkdir "cinco/dir$i"

    for j in {1..4}; do
       case $j in
          1) echo 1 > "cinco/dir$i/arq$j.txt" ;;
          2) echo -e "2\n2" > "cinco/dir$i/arq$j.txt" ;;
          3) echo -e "3\n3\n3" > "cinco/dir$i/arq$j.txt" ;;
          4) echo -e "4\n4\n4\n4" > "cinco/dir$i/arq$j.txt" ;;
	esac
     done
done

