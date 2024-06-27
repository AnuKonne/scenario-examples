
### Create an AuthorizationPolicy named helloworld-policy in the world-app namespace using Istio with the following requirements:

* The action must be set to ALLOW.
* The rules should specify the following:
* For the source:
  * Namespaces should be "hello-system"
  * Peers should enforce mutual TLS with the mode set to STRICT.
  * Mutual TLS should be disabled for port 8080.
* For the destination:
  * The allowed HTTP methods should be ["GET", "POST"].


<br>
<details><summary>Solution</summary>
<br>

```plain 
apiVersion: security.istio.io/v1beta1
kind: AuthorizationPolicy
metadata:
  name: helloworld-policy
  namespace: world-app
spec:
  action: ALLOW
  rules:
  - from:
    - source:
        namespaces: ["hello-system"]
        peers:
          mtls: { mode: STRICT }
          ports:
            8080: { disable: true }
    to:
    - operation:
        methods: ["GET", "POST"]

kubectl apply -f filename.yaml 
```{{}}

</details>