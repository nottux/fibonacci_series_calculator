#!/bin/sh
echo "are you want to write output to a file? (yes/no)"
read v
if [ $v = n -o $v = N -o $v = No -o $v = no -o $v = NO ]; then b=u; x=cat; else b=d; fi
if [ $v = y -o $v = Y -o $v = Yes -o $v = yes -o $v = YES ]; then echo "do you want output wroten to a existing file or new file? (existing/new)"; echo "if you say new, if given file is existed, will be replaced with output"; echo "if you say existing, output will be added to the file"; read v; b=u; fi
if [ $b = "d" ]; then echo wrong entry, ending; exit; fi
if [ $v = New -o $v = new -o $v = NEW ]; then x=" > "; a=g; else a=l; fi
if [ $v = Existing -o $v = EXISTING -o $v = existing ]; then x=" >> "; a=g; fi
if [ $a = "l" -a $b = "d" ]; then echo wrong entry, ending; exit; fi
if [ $a = "g" ]; then echo enter file name with directory; read f; x="cat$x$f"; fi
echo "do you want count of the numbers placed beginning of each number? (yes/no)"
echo "in example :"
echo "     1)1"
echo "     2)1"
echo "     3)2"
echo "     4)3"
echo "     5)8"
echo "      ."
echo "      ."
echo "      ."
echo if you say no, numbers will be placed line by line
echo "in example :"
echo 1
echo 1
echo 2
echo 3
echo 5
echo 8
echo .
echo .
echo .
read v
if [ $v = y -o $v = Y -o $v = Yes -o $v = yes -o $v = YES ]; then b=u; j="cat -n"; else b=d; fi
if [ $v = n -o $v = N -o $v = No -o $v = no -o $v = NO ]; then b=u; j=cat; fi
if [ $b = "d" ]; then echo wrong entry, ending; exit; fi
echo enter the limit
read v
l=$(echo $v-2 | bc | tr -d '\\\n')
a=$(echo "($l-2)/3" | bc | tr -d '\\\n')
b=$(echo "($l-2)/3" | bc -l | tr -d '\\\n')
z=$(echo $b-$a | bc)
a=$(echo "($l-1)/3" | bc | tr -d '\\\n')
b=$(echo "($l-1)/3" | bc -l | tr -d '\\\n')
m=$(echo $b-$a | bc)
a=$(echo $l/3 | bc | tr -d '\\\n')
b=$(echo $l/3 | bc -l | tr -d '\\\n')
n=$(echo $b-$a | bc)
if [ $v = 0 ]; then echo wrong entry!; exit; fi
if [ $v = 1 ]; then echo "     1)1"; exit; fi
if [ $v = 2 ]; then echo "     1)1"; echo "     2)1"; exit; fi
if [ $n = 0 ]; then g=$(echo $l/3 | bc | tr -d '\\\n'); k="cat"; fi
if [ $m = 0 ]; then g=$(echo "($l-1)/3+1" | bc | tr -d '\\\n'); k="head -n -2"; fi
if [ $z = 0 ]; then g=$(echo "($l+1)/3" | bc | tr -d '\\\n'); k="head -n -1"; fi
i=1
a=1
b=1
y=1
(echo 1; echo 1; while [ $y = 1 ]; do c=$(echo $a+$b | bc | tr -d '\\\n'); a=$(echo $c+$b | bc | tr -d '\\\n'); b=$(echo $c+$a | bc | tr -d '\\\n'); echo $c; echo $a; echo $b; i=$(echo $i+1 | bc | tr -d '\\\n'); y=$(echo "$i<=$g" | bc); done) | $k | $j | tr '	' ")" | eval $x
