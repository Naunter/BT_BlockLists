#!/usr/bin/env sh
# Reference from https://gist.github.com/johntyree/3331662#gistcomment-3215328

# This script is just for reference
# Please Check the update to date file: https://github.com/Naunter/BT_BlockLists/blob/master/.github/workflows/main.yml

# Download from iblocklist
curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:47.0) Gecko/20100101 Firefox/47.0" -s https://www.iblocklist.com/lists.php \
| sed -n "s/.*value='\(http:.*\)'.*/\1/p" \
| sed "s/\&amp;/\&/g" \
| sed "s/http/\"http/g" \
| sed "s/gz/gz\"/g" \
| xargs curl -s -L \
| gunzip \
| egrep -v '^#' \
| sed "/^$/d" > /tmp/bt_blocklists

# Download from mirror.codebucket.de
curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:47.0) Gecko/20100101 Firefox/47.0" -s https://mirror.codebucket.de/transmission/blocklist.p2p >> /tmp/bt_blocklists

# Download from www.wael.name
curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:47.0) Gecko/20100101 Firefox/47.0" -s https://www.wael.name/wael.list.txt | sed "/^#.*/d" | grep -Ev "^[0-9][0-9][0-9]\.[0-9][0-9][0-9].*" >> /tmp/bt_blocklists

# Remove duplicates
sort --unique /tmp/bt_blocklists > /tmp/bt_blocklists_deduplicated
mv /tmp/bt_blocklists_deduplicated /tmp/bt_blocklists

# Zip all files
gzip -c /tmp/bt_blocklists > /tmp/bt_blocklists.gz
