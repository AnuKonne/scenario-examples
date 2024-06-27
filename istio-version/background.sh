#!/bin/bash

curl -L https://istio.io/downloadIstio | sh -
sleep 5
ISTIO_DIR="istio-1.22.1"
cd "$ISTIO_DIR"
export PATH=$PWD/bin:$PATH
istioctl install --set profile=demo -y