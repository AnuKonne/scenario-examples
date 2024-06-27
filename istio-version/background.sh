#!/bin/bash

curl -L https://istio.io/downloadIstio | sh -
ISTIO_DIR=$(find ./istio-* -maxdepth 0 -type d | head -n 1)
cd $ISTIO_DIR
export PATH=$PWD/bin:$PATH
istioctl install --set profile=demo -y