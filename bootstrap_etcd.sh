#!/bin/bash

# Install required packages
echo ---------------------------------------------
echo "[TASK 2] Download and Install etcd v3.5.6"
RELEASE=v3.5.6
wget https://github.com/etcd-io/etcd/releases/download/${RELEASE}/etcd-${RELEASE}-linux-amd64.tar.gz

tar xf etcd-${RELEASE}-linux-amd64.tar.gz
cd etcd-${RELEASE}-linux-amd64
mv etcd etcdctl /usr/local/bin
cd ..
rm -rf etcd-${RELEASE}-linux-amd64
echo ---------------------------------------------