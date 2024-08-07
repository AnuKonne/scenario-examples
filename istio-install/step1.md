
### To enhance the service mesh capabilities of our Kubernetes cluster, we need to install Istio, which will enable advanced traffic management, security features, and observability for microservices running within the cluster

<br>
<details><summary>Solution</summary>
<br>

```plain 
curl -L https://istio.io/downloadIstio | sh -
cd istio-VERSIONNUMBER
export PATH=$PWD/bin:$PATH
istioctl install --set profile=demo -y
```{{}}

</details>


<br>
<details><summary>Final Output Should be like</summary>
<br>

```plain 
controlplane $ istioctl install --set profile=demo -y
✔ Istio core installed
✔ Istiod installed
✔ Egress gateways installed
✔ Ingress gateways installed
✔ Installation complete
Made this installation the default for injection and validation.
```{{}}

</details>