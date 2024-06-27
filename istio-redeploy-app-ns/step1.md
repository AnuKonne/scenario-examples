
### After enabling Istio injection in the default namespace, we need to redeploy the application for the changes to take effect.

<br>
<details><summary>Solution</summary>
<br>

```plain 
kubectl replace -f helloworld.yaml --force

Important : Check how many containers are running in each pod now, it must be 2 Container
```{{}}

</details>