
### Describe how you would configure an Istio VirtualService named helloworld to handle incoming HTTP traffic for the hostname "hello.world.com". The VirtualService should route requests with specific path prefixes to a backend service named hello running on port 8080. Provide a YAML configuration snippet that includes:

* Hostname: "hello.world.com"
* Gateway: helloworld-gateway
* Two route rules:
  * Route requests with the path prefix "/capital" to service hello on port 8080.
  * Route requests with the path prefix "/small" to the same service hello on port 8080.

Ensure that the VirtualService is correctly configured to handle traffic based on these path prefixes under the specified hostname.


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
  - "hello.world.com"
  gateways:
  - helloworld-gateway
  http:
  - match:
    - uri:
        prefix: /capital
    route:
    - destination:
        host: helloworld
        port:
          number: 8080

  - match:
    - uri:
        prefix: /small
    route:
    - destination:
        host: helloworld
        port:
          number: 8080

kubectl apply -f filename.yaml
```{{}}

</details>