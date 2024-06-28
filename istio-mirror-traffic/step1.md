
### Mirror 10% of the traffic from the productpage service to a different version (v2) for testing purposes without affecting the production traffic.

Steps:

Deploy both versions of the productpage service.
Create a virtual service to mirror traffic.

<br>
<details><summary>Solution</summary>
<br>

Step 1 :
```plain 
kubectl apply -f productpage-deployment.yaml
```{{}}

Step 2 :
```plain 
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: productpage
  namespace: default
spec:
  hosts:
  - productpage
  http:
  - route:
    - destination:
        host: productpage
        subset: v1
  - mirror:
      host: productpage
      subset: v2
    mirrorPercentage:
      value: 10.0
```{{}}

Step 3 :
```
kubectl apply -f productpage-mirror.yaml
```{{}}
</details>