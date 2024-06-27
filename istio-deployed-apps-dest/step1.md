
### Now helloworld service traffic is routed to both helloworld-1, helloworld-2 and helloworld-3 application

Let's configure weighted routing between hw-1, hw-2, and hw-3. First, create a DestinationRule named myapp with the following specification:

* Destination Rule Name: helloworld-dr
* Host Name : helloworld
* Required Subsets:
  * Subset 1:
    * Name: version1
    * Labels: version=appv1
  * Subset 2:
    * Name: version2
    * Labels: version=appv2 
  * Subset 3:
    * Name: version3
    * Labels: version=appv3

This configuration will allow you to define subsets for different (version1, version2, version3) of your application (myapp) and configure weighted routing between them using Istio's DestinationRule.

<br>
<details><summary>Solution</summary>
<br>

```plain 
apiVersion: networking.istio.io/v1alpha3
kind: DestinationRule
metadata:
  name: helloworld-dr
spec:
  host: helloworld
  subsets:
    - name: version1
      labels:
        version: appv1
    - name: version2
      labels:
        version: appv2
    - name: version3
      labels:
        version: appv3

kubectl apply -f filename.yaml
```{{}}

</details>