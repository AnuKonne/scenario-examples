#!/bin/bash

echo 'apiVersion: apps/v1
apiVersion: apps/v1
kind: Deployment
metadata:
  name: productpage-blue
  namespace: default
  labels:
    app: productpage
    version: blue
spec:
  replicas: 1
  selector:
    matchLabels:
      app: productpage
      version: blue
  template:
    metadata:
      labels:
        app: productpage
        version: blue
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
  name: productpage-green
  namespace: default
  labels:
    app: productpage
    version: green
spec:
  replicas: 1
  selector:
    matchLabels:
      app: productpage
      version: green
  template:
    metadata:
      labels:
        app: productpage
        version: green
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
    app: productpage' > productpage-blue-green.yaml