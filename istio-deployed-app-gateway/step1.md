
### For Hello World application, Create an Istio Gateway configuration `helloworld-gateway` that routes incoming HTTP traffic using the hostname "hello.world.com".

### Describe how you would set up the Istio Gateway with the following requirements:

* Use the default Istio gateway selector.
* Configure a server to handle HTTP traffic on port 80.
* Specify "hello.world.com" as the hostname for routing traffic.


<br>
<details><summary>Solution</summary>
<br>

```plain 
apiVersion: networking.istio.io/v1alpha3
kind: Gateway
metadata:
  name: helloworld-gateway
spec:
  selector:
    istio: ingressgateway # Use the default Istio gateway selector
  servers:
  - port:
      number: 80
      name: http
      protocol: HTTP
    hosts:
    - "hello.world.com"

kubectl apply -f filename.yaml
```{{}}

</details>