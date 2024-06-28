
### Implement a canary deployment for a service called reviews in the default namespace, gradually shifting traffic from version v1 to version v2 using Istio virtual services and destination rules.

<br>
<details><summary>Solution</summary>
<br>

Step 1 : Deploy both versions of the reviews service
```plain 
kubectl apply -f reviews-v1.yaml
kubectl apply -f reviews-v2.yaml
```{{}}

Step 2 : Create a destination rule and a virtual service to manage the traffic split
```plain 
apiVersion: networking.istio.io/v1alpha3
kind: DestinationRule
metadata:
  name: reviews-destination
  namespace: default
spec:
  host: reviews
  subsets:
  - name: v1
    labels:
      version: v1
  - name: v2
    labels:
      version: v2
---
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: reviews
  namespace: default
spec:
  hosts:
  - reviews
  http:
  - route:
    - destination:
        host: reviews
        subset: v1
      weight: 80
    - destination:
        host: reviews
        subset: v2
      weight: 20
```{{}}

Step 3 : Gradually shift traffic to v2 by updating the virtual service
```
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: reviews
  namespace: default
spec:
  hosts:
  - reviews
  http:
  - route:
    - destination:
        host: reviews
        subset: v1
      weight: 50
    - destination:
        host: reviews
        subset: v2
      weight: 50
```{{}}
</details>