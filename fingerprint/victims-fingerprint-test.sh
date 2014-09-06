#! /usr/bin/env bash

git clone $1
cd $(basename $1 | sed s/'.git'//)

OUTPUT="/tmp/results.log"

rm -f ${OUTPUT}

for d in $(find /usr/lib/jvm/ -maxdepth 1 -type d -name 'java-1.*-openjdk-*'); do
    echo "[VICTIMS] Testing with $(basename $d)" >> ${OUTPUT}
    sudo alternatives --set javac $d/bin/javac
    mvn clean package -DskipTests
    for jar in $(find ./target -name "*.jar"); do
        victims-java-client --jar-info "$jar" >> ${OUTPUT}
    done;
done

cat ${OUTPUT}
