#!/bin/bash

export ISTIO_VERSION=1.22.1
curl -L https://istio.io/downloadIstio | TARGET_ARCH=x86_64 sh -
echo "export PATH=/root/istio-${ISTIO_VERSION}/bin:\$PATH" >> .bashrc
export PATH=/root/istio-${ISTIO_VERSION}/bin:$PATH
mv /tmp/demo.yaml /root/istio-${ISTIO_VERSION}/manifests/profiles/
istioctl install --set profile=demo -y --manifests=/root/istio-${ISTIO_VERSION}/manifests
touch /ks/.istiofinished


kubectl label namespace default istio-injection=enabled

kubectl apply -f - <<EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  name: helloworld
  labels:
    app: helloworld
spec:
  replicas: 1
  selector:
    matchLabels:
      app: helloworld
  template:
    metadata:
      labels:
        app: helloworld
    spec:
      containers:
      - name: helloworld
        image: "gcr.io/google-samples/hello-app:1.0"
        ports:
        - containerPort: 8080
---
apiVersion: v1
kind: Service
metadata:
  name: helloworld
  labels:
    app: helloworld
spec:
  ports:
  - port: 8080
    name: http
  selector:
    app: helloworld
---
apiVersion: networking.istio.io/v1alpha3
kind: Gateway
metadata:
  name: helloworld-gateway
spec:
  selector:
    istio: ingressgateway # Use the default Istio gateway selector
  servers:
  - port:
      number: 80
      name: http
      protocol: HTTP
    hosts:
    - "hello.world.com"
EOF

echo 'apiVersion: apps/v1
kind: Deployment
metadata:
  name: helloworld
  labels:
    app: helloworld
spec:
  replicas: 1
  selector:
    matchLabels:
      app: helloworld
  template:
    metadata:
      labels:
        app: helloworld
    spec:
      containers:
      - name: helloworld
        image: "gcr.io/google-samples/hello-app:1.0"
        ports:
        - containerPort: 8080
---
apiVersion: v1
kind: Service
metadata:
  name: helloworld
  labels:
    app: helloworld
spec:
  ports:
  - port: 8080
    name: http
  selector:
    app: helloworld' > helloworld.yaml
