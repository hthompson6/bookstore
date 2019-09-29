#!/bin/bash

CHECK_VIRT=$(egrep -c '(vmx|svm)' /proc/cpuinfo) 

if [[ $CHECK_VIRT -le 0 ]]
then
    echo "ERROR: Virtualization Not Supported"
    exit 1
fi

source ../docker/install_docker.sh

echo "========Installing MiniKube========"
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube
sudo mkdir -p /usr/local/bin/
sudo install minikube /usr/local/bin/
export CHANGE_MINIKUBE_NONE_USER=true

echo "========Installing Kompose========"
curl -L https://github.com/kubernetes/kompose/releases/download/v1.16.0/kompose-linux-amd64 -o kompose
chmod +x kompose
sudo mv ./kompose /usr/local/bin/kompose

echo "========Installing Kubectl========"
sudo apt-get update && sudo apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl
