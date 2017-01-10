#!/bin/bash
if [[ $# -eq 0 ]] ; then
    echo '[path] [[CV_FACTOR]] [[SAMPLE_SIZE]]'
    exit 1
fi

PATH=$1

CV_FACTOR=${2:-0.08}
SAMPLE_SIZE=${3:-8}
CV_SAMPLE_SIZE=$((SAMPLE_SIZE/2))

mkdir -p $PATH
cd $PATH

rm test -rf
rm train -rf
rm valid -rf
rm sample -rf

kg download

unzip test.zip
unzip train.zip

mkdir valid
mkdir -p sample/train
mkdir -p sample/valid

for prefix in `ls train/*.jpg | awk '{print gensub(/^.*\/([^\.]*)\..*$/,"\\1","g",$1)}' | uniq` ; do
 DIR=${prefix}s
 mkdir train/$DIR sample/train/$DIR
 mkdir valid/$DIR sample/valid/$DIR
 mv "train/$prefix."*".jpg" "train/$DIR"
 TOTAL=`ls train/$DIR | sort -R | wc -l`
 TOPd=`echo "$TOTAL * $CV_FACTOR" | bc`
 TOP=`printf '%.0f' $TOPd`
 ls train/$DIR | sort -R | head -n $TOP | xargs -I@ sh -c "mv train/$DIR/@ valid/$DIR/@" 
 ls train/$DIR | sort -R | head -n $SAMPLE_SIZE | xargs -I@ sh -c "cp train/$DIR/@ sample/train/$DIR/@" 
 ls valid/$DIR | sort -R | head -n $CV_SAMPLE_SIZE | xargs -I@ sh -c "cp valid/$DIR/@ sample/valid/$DIR/@" 
done


#ls train/*.jpg | awk '{gsub(/\..*$/,"", $1);print}' | uniq | xargs -d"\n" -I"{}" mkdir {}s

#ls train/*.jpg | awk '{print $1 " "gensub(/\/([^\.]*)\./,"/\\1s/", "g",$1)}'  | xargs -n2 mv
#ls train/*.jpg | awk '{gsub(/\..*$/,"", $1);print}' | uniq | xargs -I"{}" sh -c 'mv {}.*.jpg {}s'

#for d in train/* ; do
#    TOTAL=`ls $d | sort -R | wc -l`
#    TOPd=`echo "$TOTAL * $SAMPLE_FACTOR" | bc`
#    TOP=`printf '%.0f' $TOPd`
#    echo $TOP
#    ls $d | sort -R | head -n $TOP | xargs
#done

#rm test.zip
#rm train.zip 



