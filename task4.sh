#! /bin/bash

CALE=$1
NUME=$2

if test $# -ne 2; then
	exit 4;
fi

ls $CALE &> /dev/null || exit 5
cd $CALE; pwd | grep /home/student/task4 > /dev/null || exit 6; cd /home/student/
ls $CALE/angajati.txt &> /dev/null  || exit 7
 
cat $CALE/angajati.txt | head | grep $NUME > result.txt
cat $CALE/angajati.txt | tail | grep $NUME >> result.txt

cat result.txt | sed 's/\\/ /g'  | sort -k 4,4 | head -1 | cut -d " " -f4 > salariumin.txt
cat result.txt | grep $(cat salariumin.txt) | sed 's/\\/ /g' | sort -r -k 5,5 | head -1 | cut -d " " -f1 

rm *.txt

exit 8




