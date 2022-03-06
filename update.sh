#!/usr/bin/env sh
# Reference from https://gist.github.com/johntyree/3331662#gistcomment-3215328

# Download lists, unpack and filter, write to stdout
curl -A "User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:47.0) Gecko/20100101 Firefox/47.0" -s https://www.iblocklist.com/lists.php \
| sed -n "s/.*value='\(http:.*\)'.*/\1/p" \
| sed "s/\&amp;/\&/g" \
| sed "s/http/\"http/g" \
| sed "s/gz/gz\"/g" \
| xargs curl -s -L \
| gunzip \
| egrep -v '^#' \
| sed "/^$/d" \
| gzip - > /tmp/bt_blocklists.gz
