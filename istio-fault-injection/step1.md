
### Configure fault injection to introduce a delay of 5 seconds for 10% of the traffic to the ratings service in the default namespace.

<br>
<details><summary>Solution</summary>
<br>

Step 1 : Create a virtual service with fault injection rules
```plain 
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: ratings
  namespace: default
spec:
  hosts:
  - ratings
  http:
  - fault:
      delay:
        percentage:
          value: 10.0
        fixedDelay: 5s
    route:
    - destination:
        host: ratings
        subset: v1
```{{}}
</details>