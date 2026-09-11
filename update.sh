#! /bin/bash
wget -i url.txt -O - | sed "/^#.*/d" | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" | sort --unique > list_1.txt

while read line; do 
echo "blocklist:$line-$line"; 
done < list_1.txt > combined_1.txt

curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:47.0) Gecko/20100101 Firefox/47.0" -s https://www.iblocklist.com/lists.php \
        | sed -n "s/.*value='\(http:.*\)'.*/\1/p" \
        | sed "s/\&amp;/\&/g" \
        | sed "s/http/\"http/g" \
        | sed "s/gz/gz\"/g" \
        | xargs curl -s -L \
        | gunzip \
        | egrep -v '^#' \
        | sed "/^$/d" >> combined_1.txt
        
curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:47.0) Gecko/20100101 Firefox/47.0" -s https://mirror.codebucket.de/transmission/blocklist.p2p >> combined_1.txt

curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:47.0) Gecko/20100101 Firefox/47.0" -s https://raw.githubusercontent.com/waelisa/Best-blocklist/main/wael.list.txt | sed "/^#.*/d" | grep -Ev "^[0-9][0-9][0-9]\.[0-9][0-9][0-9].*" >> combined_1.txt

sort --unique combined_1.txt > combined_2.txt

gzip -c combined_2.txt > bt_blocklists.gz
