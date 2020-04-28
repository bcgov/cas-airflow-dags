#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <bucket_name> [<file_path>]"
    exit 0
fi

if [ -z "$2" ]; then
    FILE_URLS=$(sh bin/wget-spider.sh | awk '{printf "--url=\"%s\" ",$0}')
    echo $FILE_URLS
else
    cat $2
    FILE_URLS=$(cat $2 | awk '{printf "--url=\"%s\" ",$0}')
fi

node stream-minio --ssl --bucket="$1" $FILE_URLS
