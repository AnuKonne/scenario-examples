
### Apply the existing grafana-istio.yaml file to your Kubernetes cluster in the istio-system namespace to set up Grafana for visualizing metrics from Istio components. Provide the command to apply the configuration and discuss the role of visualization in monitoring and managing a service mesh.


<br>
<details><summary>Solution</summary>
<br>

```plain 
kubectl apply -f grafana-istio.yaml
```{{}}

OR

```plain 
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.22/samples/addons/grafana.yaml
```{{}}

</details>

Link : [Grafana Istio](https://istio.io/latest/docs/ops/integrations/grafana/)