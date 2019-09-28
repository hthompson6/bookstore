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

sudo apt update
sudo apt install -y qemu qemu-kvm libvirt-bin bridge-utils virt-manager

sudo service libvirtd start
sudo update-rc.d libvirtd enable

CHECK_LIBVIRT_STATUS=$(sudo service libvirtd status | egrep -c "active")

if [[ $CHECK_LIBVIRT_STATUS -le 0 ]]
then
    echo "ERROR: libvirt Service Not Started"
    exit 1
fi
