#!/bin/bash

curl -L https://istio.io/downloadIstio | sh -
sleep 5
ISTIO_DIR=
for dir in ./istio-*; do
  if [ -d "$dir" ]; then
    ISTIO_DIR="$dir"
    break
  fi
done
cd "$ISTIO_DIR"
export PATH=$PWD/bin:$PATH
istioctl install --set profile=demo -y