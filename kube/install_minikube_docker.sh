#!/bin/bash

CHECK_VIRT=$(egrep -c '(vmx|svm)' /proc/cpuinfo) 

if [[ $CHECK_VIRT -le 0 ]]
then
    echo "ERROR: Virtualization Not Supported"
    exit 1
fi

source ../docker/install_docker.sh

curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube

sudo mkdir -p /usr/local/bin/
sudo install minikube /usr/local/bin/
