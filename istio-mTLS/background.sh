#!/bin/bash

kubectl apply -f - <<EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  name: details
  namespace: default
  labels:
    app: details
    version: v1
spec:
  replicas: 1
  selector:
    matchLabels:
      app: details
      version: v1
  template:
    metadata:
      labels:
        app: details
        version: v1
    spec:
      containers:
      - name: details
        image: istio/examples-bookinfo-details-v1:1.15.0
        ports:
        - containerPort: 9080
---
apiVersion: v1
kind: Service
metadata:
  name: details
  namespace: default
  labels:
    app: details
spec:
  ports:
  - port: 9080
    name: http
  selector:
    app: details
EOF