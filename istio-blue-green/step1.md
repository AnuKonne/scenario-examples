
### Implement a blue-green deployment for a service called productpage in the default namespace, switching traffic from the blue (current) version to the green (new) version.

Steps:

Deploy both blue and green versions of the productpage service.
Create a virtual service to manage traffic switching.

<br>
<details><summary>Solution</summary>
<br>

Step 1 :
```plain 
kubectl apply -f productpage-blue-green.yaml
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
        subset: blue
      weight: 100
    - destination:
        host: productpage
        subset: green
      weight: 0
```{{}}

Step 3 :
```
kubectl apply -f productpage-virtualservice.yaml
```{{}}
</details>