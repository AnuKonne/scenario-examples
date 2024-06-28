
### Configure circuit breaking for the reviews service to limit the number of concurrent connections to 1.

Steps:

Create a destination rule for the reviews service with circuit breaking configuration.

<br>
<details><summary>Solution</summary>
<br>

```plain 
kubectl apply -f reviews-circuit-breaking.yaml
```{{}}
</details>