#!/bin/bash

curl -L https://istio.io/downloadIstio | sh -
export ISTIO_DIR=$(find ./istio-* -maxdepth 1 -type d -print -quit)
cd "$ISTIO_DIR"
export PATH=$PWD/bin:$PATH
istioctl install --set profile=demo -y