#!/bin/bash

curl -L https://istio.io/downloadIstio | sh -
ISTIO_DIR=$(ls -d istio-*)
cd $ISTIO_DIR
export PATH=$PWD/bin:$PATH
istioctl install --set profile=demo -y