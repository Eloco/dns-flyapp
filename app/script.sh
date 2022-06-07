#!/bin/sh

for i in `cat blocklist.url | sed -r 's/#[^#?]*$//g'`;do (curl -f  $i | grep '^[0-9a-Z]' | sed 's/0.0.0.0\s*//g' ) >> ./blocklist.txt ; done

cat /etc/hosts

if grep -q 'fly-global-services' /etc/hosts; then
    result=`grep 'fly-global-services' /etc/hosts | head -n 1 | awk -F ' ' '{print $1}'`
    sed -i 's/0.0.0.0/'${result}'/g' dcompass.yaml
else
    echo not found
fi

head dcompass.yaml

./dcompass -c ./dcompass.yaml
