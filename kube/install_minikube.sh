#!/bin/bash

CHECK_VIRT=$(egrep -c '(vmx|svm)' /proc/cpuinfo) 

if [[ $CHECK_VIRT -le 0 ]]
then
    echo "ERROR: Virtualization Not Supported"
    exit 1
fi

sudo apt install -y cpu-checker

CHECK_KVM=$(sudo kvm-ok | egrep -c "KVM acceleration can NOT be used")

if [[ $CHECK_KVM -gt 0 ]]
then
    echo "ERROR: KVM Acceleration Not Supported"
    echo "$(sudo kvm-ok)" 
    exit 1
fi
