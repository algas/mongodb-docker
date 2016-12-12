FROM ubuntu:14.04
MAINTAINER sgt.yamauchi@gmail.com

USER root
WORKDIR /tmp

RUN apt-get update && apt-get install -y wget
RUN \
  bash -c "if [[ ! -d mongodb-linux-x86_64-3.0.5 ]]; then wget http://downloads.mongodb.org/linux/mongodb-linux-x86_64-3.0.5.tgz && tar xvzf mongodb-linux-x86_64-3.0.5.tgz; fi" && \
  cp mongodb-linux-x86_64-3.0.5/bin/* /usr/bin && \
  mkdir -p /data/db && \
  echo "storageEngine=wiredTiger" |  tee -a /etc/mongodb.conf

ENTRYPOINT ["/usr/bin/mongod"]
