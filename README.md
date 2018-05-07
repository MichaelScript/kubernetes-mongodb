# kubernetes-mongodb
Working mongodb replica sets with kubernetes


You'll need a secret for your mongodb key if you don't have one already: `sh generate-secret.sh`

```
kubectl create -f mongodb.yaml
```

This will create a mongodb replica set across three nodes with an admin account that has credentials you define with environment variables.


Other useful things:
Statefulsets aren't deleted in the same way (because of a bug I believe) as other things so here is an easy teardown for debugging stuff:
```
# Note you wouldn't want to do this normally.
kubectl delete statefulsets mongod --force --grace-period=0 --cascade=false;
kubectl delete services mongodb-service;
kubectl delete pods all --grace-period=0 --force;
```


The majority of the yaml is based on:
https://pauldone.blogspot.com/2017/06/deploying-mongodb-on-kubernetes-gke25.html

The automatic configuration / pod introspection is written by me, which uses a different approach to configuring pods then scripts you have to call manually.

This fixes some of the bugs that were present in that yaml were a pain to figure out. Figured I would share. This also works locally with minikube (version 0.26) independent of google cloud.
