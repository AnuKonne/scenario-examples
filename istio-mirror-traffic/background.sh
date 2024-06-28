#!/bin/bash

echo 'apiVersion: apps/v1
kind: Deployment
metadata:
  name: productpage-v1
  namespace: default
  labels:
    app: productpage
    version: v1
spec:
  replicas: 1
  selector:
    matchLabels:
      app: productpage
      version: v1
  template:
    metadata:
      labels:
        app: productpage
        version: v1
    spec:
      containers:
      - name: productpage
        image: istio/examples-bookinfo-productpage-v1:1.15.0
        ports:
        - containerPort: 9080
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: productpage-v2
  namespace: default
  labels:
    app: productpage
    version: v2
spec:
  replicas: 1
  selector:
    matchLabels:
      app: productpage
      version: v2
  template:
    metadata:
      labels:
        app: productpage
        version: v2
    spec:
      containers:
      - name: productpage
        image: istio/examples-bookinfo-productpage-v2:1.15.0
        ports:
        - containerPort: 9080
---
apiVersion: v1
kind: Service
metadata:
  name: productpage
  namespace: default
  labels:
    app: productpage
spec:
  ports:
  - port: 9080
    name: http
  selector:
    app: productpage' > productpage-deployment.yaml