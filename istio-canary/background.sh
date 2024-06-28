#!/bin/bash

echo 'apiVersion: apps/v1
kind: Deployment
metadata:
  name: reviews-v1
  namespace: default
  labels:
    app: reviews
    version: v1
spec:
  replicas: 1
  selector:
    matchLabels:
      app: reviews
      version: v1
  template:
    metadata:
      labels:
        app: reviews
        version: v1
    spec:
      containers:
      - name: reviews
        image: istio/examples-bookinfo-reviews-v1:1.15.0
        ports:
        - containerPort: 9080
---
apiVersion: v1
kind: Service
metadata:
  name: reviews
  namespace: default
  labels:
    app: reviews
spec:
  ports:
  - port: 9080
    name: http
  selector:
    app: reviews' > reviews-v1.yaml

echo 'apiVersion: apps/v1
kind: Deployment
metadata:
  name: reviews-v2
  namespace: default
  labels:
    app: reviews
    version: v2
spec:
  replicas: 1
  selector:
    matchLabels:
      app: reviews
      version: v2
  template:
    metadata:
      labels:
        app: reviews
        version: v2
    spec:
      containers:
      - name: reviews
        image: istio/examples-bookinfo-reviews-v2:1.15.0
        ports:
        - containerPort: 9080' > reviews-v2.yaml
