# kubernetes-mongodb
Working mongodb replica sets with kubernetes


First generate a secret using the generate secret script

```
kubectl create -f mongodb.yaml
```


Other useful things:
Statefulsets aren't deleted in the same way as other things so here is an easy teardown for debugging stuff:
```
kubectl delete statefulsets mongod --force --grace-period=0 --cascade=false;
kubectl delete all --all;
kubectl delete pods --all --grace-period=0 --force;
```


The majority of the yaml is based on:
https://pauldone.blogspot.com/2017/06/deploying-mongodb-on-kubernetes-gke25.html

This fixes some of the bugs that were present in that yaml were a pain to figure out. Figured I would share. This also works locally with minikube (version 0.26) independent of google cloud.