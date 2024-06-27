
### You have an existing Istio VirtualService named helloworld-vs that routes traffic to different versions of the helloworld service based on path prefixes. Recently, there's a requirement to adjust the traffic distribution among the service versions using weighted routing. Update the existing VirtualService configuration to achieve the following:

* Name: helloworld
* Host: helloworld
* Port 8080 for all application
* HTTP Routes:
  * Maintain existing path-based routing configurations.
  * Implement weighted routing to distribute traffic as follows:
    * Route /v1 to version1 with 60% of traffic.
    * Route /v2 to version2 with 30% of traffic.
    * Route /v3 to version3 with 10% of traffic.
* Ensure the VirtualService continues to use the helloworld-gateway for traffic ingress.

<br>
<details><summary>Solution</summary>
<br>

```plain 
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: helloworld
spec:
  hosts:
  - helloworld
  http:
  - route:
    - destination:
        host: helloworld
        subset: version1
        port:
          number: 8080
      weight: 50
    - destination:
        host: helloworld
        subset: version2
        port:
          number: 8080
      weight: 30
    - destination:
        host: helloworld
        subset: version3
        port:
          number: 8080
      weight: 20
  gateways:
  - helloworld-gateway

kubectl apply -f filename.yaml
```{{}}

</details>