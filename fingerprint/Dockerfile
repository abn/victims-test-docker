#
#
#

FROM fedora:20

RUN \
    yum -y install git java-1.7.0-openjdk-devel java-1.8.0-openjdk-devel maven

ENV VICTIMS_HOME /victims
ENV VICTIMS_CLIENT_LOCAL /victims/victims-client-java
RUN \
    mkdir /victims && cd /victims \
    && git clone https://github.com/victims/victims-client-java.git

RUN \
    cd $VICTIMS_CLIENT_LOCAL \
    && mvn clean package -DskipTests \
    && cp $VICTIMS_CLIENT_LOCAL/target/*-standalone.jar $VICTIMS_HOME/. \
    && mvn clean

ADD victims-java-client.sh /usr/bin/victims-java-client
ADD victims-fingerprint-test.sh /usr/bin/victims-fingerprint-test

WORKDIR /tmp

CMD ["bash"]
