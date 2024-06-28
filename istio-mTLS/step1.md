
### Apply mutual TLS to the details service in the default namespace to ensure secure communication.

<br>
<details><summary>Solution</summary>
<br>

Step 1 : Enable mTLS using a PeerAuthentication resource
```plain 
apiVersion: security.istio.io/v1beta1
kind: PeerAuthentication
metadata:
  name: details-mtls
  namespace: default
spec:
  selector:
    matchLabels:
      app: details
  mtls:
    mode: STRICT
```{{}}

Step 2 : Create a destination rule to enforce mTLS
```plain 
apiVersion: networking.istio.io/v1alpha3
kind: DestinationRule
metadata:
  name: details-destination
  namespace: default
spec:
  host: details
  trafficPolicy:
    tls:
      mode: ISTIO_MUTUAL
```{{}}
</details>