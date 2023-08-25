#!/bin/bash
PACKAGE_NAME=$1
cd $2 && \
apt-cache depends --recurse -o APT::Cache::ShowOnlyFirstOr=true --no-recommends --no-suggests --no-breaks --no-suggests --no-replaces --no-conflicts --no-pre-depends -i ${PACKAGE_NAME} |
grep -v "<" |
awk '/Depends:/ {print $2}' |
sort |
uniq |
xargs apt-get download &&
apt-get download ${PACKAGE_NAME}
\
