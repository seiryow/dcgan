#!/bin/sh

code=$1

rm -rf ./data/"$code"_gen
mkdir -p ./data/"$code"_gen
cp ./data/"$code"/*.png ./data/"$code"_gen/

for file in ./data/"$code"_gen/*.png;
do
	echo $file;
	convert "$file" -colorspace gray "$file";
done

for file in ./data/"$code"_gen/*.png;
do
	tofile="${file%.*}"
	echo $file;
	convert "$file" -flip "${tofile}"-flip.png;
	convert "$file" -flop "${tofile}"-flop.png;
done

for file in ./data/"$code"_gen/*.png;
do
	tofile="${file%.*}"
	echo $file;
	convert "$file" -rotate 90 "${tofile}"_90.png;
	convert "$file" -rotate 180 "${tofile}"_180.png;
	convert "$file" -rotate 270 "${tofile}"_270.png;
done

coef=`ls ./data/"$code"_gen/*.png | wc -l`
coef=$((250000/coef))

for file in ./data/"$code"_gen/*.png;
do
    echo $file
	for i in `seq 1 $coef`
	do
		tofile="${file%.*}"
		echo -n "\rWelcome $i times"
		cp "$file" "${tofile}_$i".png;
	done
    echo
done
