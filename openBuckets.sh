#/bin/sh

BUCKET_URL='http://s3-sa-east-1.amazonaws.com/'
BUCKET_NAMES_FILE='bucket-names'
OUTPUT_FILE='open-buckets.txt'

for i in $(cat $BUCKET_NAMES_FILE)
do
  echo "Checking bucket "$i"..."
  curl -s -I $BUCKET_URL$i |
  if grep -q "200 OK"; then
    echo "> OPEN!"
    echo $i >> $OUTPUT_FILE
  fi
done
