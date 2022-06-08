#!/bin/sh

cat /etc/hosts

if [ $PROXY ];then
    export -p
	echo "PROXY = $PROXY"
    sed -i 's/#proxy:/proxy: '${PROXY}'/g' dcompass.yaml
else
    echo 'PROXY not set'
fi

if grep -q 'fly-global-services' /etc/hosts; then
    echo 'found fly-global-services'
    result=`grep 'fly-global-services' /etc/hosts | head -n 1 | awk -F ' ' '{print $1}'`
    sed -i 's/0.0.0.0/'${result}'/g' dcompass.yaml
else
    echo 'not found fly-global-services'
fi

head dcompass.yaml
grep -i proxy dcompass.yaml

./dcompass -c ./dcompass.yaml
