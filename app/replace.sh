#!/bin/bash
if grep -q 'fly-global-services' /etc/hosts; then
    result=`grep 'fly-global-services' /etc/hosts | head -n 1 | awk -F ' ' '{print $1}'`
    sed -i 's/0.0.0.0/'${result}'/g' dcompass.yaml
else
    echo not found
fi
