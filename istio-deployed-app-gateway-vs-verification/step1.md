
### Let's proceed with testing to ensure our gateway and virtual service rules are correctly configured. Begin by setting necessary environment variables using the following commands:

```
export INGRESS_HOST=$(kubectl get po -l istio=ingressgateway -n istio-system -o jsonpath='{.items[0].status.hostIP}')

export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}')
```{{exec}}

Now, try to access the helloworld service (with allowed paths as well)
```
curl -s -I -HHost:hello.world.com "http://$INGRESS_HOST:$INGRESS_PORT/capital"
```{{exec}}
OR
```
curl -s -I -HHost:hello.world.com "http://$INGRESS_HOST:$INGRESS_PORT/small"
```{{exec}}

and also try other paths
```
curl -s -I -HHost:hello.world.com "http://$INGRESS_HOST:$INGRESS_PORT/symbol"
```{{exec}}
OR
```
curl -s -I -HHost:hello.world.com "http://$INGRESS_HOST:$INGRESS_PORT/number"
```{{exec}}

<br>
<details><summary>Solution</summary>
<br>

```plain 
controlplane $ curl -s -I -HHost:hello.world.com "http://$INGRESS_HOST:$INGRESS_PORT/capital"    
HTTP/1.1 200 OK
date: Thu, 27 Jun 2024 11:49:47 GMT
content-length: 67
content-type: text/plain; charset=utf-8
x-envoy-upstream-service-time: 2
server: istio-envoy

---

controlplane $ curl -s -I -HHost:hello.world.com "http://$INGRESS_HOST:$INGRESS_PORT/small"    
HTTP/1.1 200 OK
date: Thu, 27 Jun 2024 11:47:09 GMT
content-length: 67
content-type: text/plain; charset=utf-8
x-envoy-upstream-service-time: 0
server: istio-envoy

---

Other paths

controlplane $ curl -s -I -HHost:hello.world.com "http://$INGRESS_HOST:$INGRESS_PORT/hello"
HTTP/1.1 404 Not Found
date: Thu, 27 Jun 2024 11:47:57 GMT
server: istio-envoy
transfer-encoding: chunked

---

controlplane $ curl -s -I -HHost:hello.world.com "http://$INGRESS_HOST:$INGRESS_PORT/world"
HTTP/1.1 404 Not Found
date: Thu, 27 Jun 2024 11:47:57 GMT
server: istio-envoy
transfer-encoding: chunked

```{{}}

</details>