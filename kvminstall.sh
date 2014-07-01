#!/bin/bash

sudo apt-get install curl unzip

curl https://raw.githubusercontent.com/aspnet/Home/master/kvminstall.sh | sh && source ~/.kre/kvm/kvm.sh

kvm upgrade