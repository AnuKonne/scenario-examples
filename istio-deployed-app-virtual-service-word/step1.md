
### Add /word path now

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


  - match: 
    - uri:
        prefix: /word
    route:
    - destination:
        host: helloworld
        port:
          number: 8080

kubectl replace -f filename.yaml --force
```{{}}

and try 
```plain 
curl -s -I -HHost:hello.world.com "http://$INGRESS_HOST:$INGRESS_PORT/word"
```{{exec}}

</details>