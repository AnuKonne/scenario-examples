
### Create a PeerAuthentication configuration for the specific-workload-peer-policy in the hello-system namespace using Istio. Describe how you would enforce security policies for a specific workload with the following specifications:

* Policy Name: helloworld-workload-peer-policy
* Namespace: helloworld-app
* Selectors: Ensure the policy applies to workloads labeled app: helloworld
* Mutual TLS Mode: Enforce strict mutual TLS (mtls.mode: STRICT) for all communication.
* Port-Level Configuration: Disable mutual TLS (portLevelMtls) specifically for traffic on port 8080 of the helloworld-workload.

Describe the rationale behind using strict mutual TLS and the specific exemption for port 8080

<br>
<details><summary>Solution</summary>
<br>

```plain 
apiVersion: security.istio.io/v1beta1
kind: PeerAuthentication
metadata:
  name: helloworld-workload-peer-policy
  namespace: hello-system
spec:
  selector:
    matchLabels:
      app: helloworld
  mtls:
    mode: STRICT
  portLevelMtls:
    8080:
      mode: DISABLE

kubectl apply -f filename.yaml 
```{{}}

</details>