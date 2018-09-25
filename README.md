# kubernetes-mongodb
Working mongodb replica sets with kubernetes and MiniKube.
If you want this to work properly on GKE just change the storage class portion.


You'll need a secret for your mongodb key if you don't have one already: `sh generate-secret.sh`

```
kubectl create -f mongodb.yaml
```

This will create a mongodb replica set across three nodes with an admin account that has credentials you define with environment variables.


Other useful things:
If you are having trouble deleting statefulsets while setting things up / testing (don't do this in production)
```
# Note you wouldn't want to do this normally.
kubectl delete statefulsets mongod --force --grace-period=0 --cascade=false;
kubectl delete services mongodb-service;
kubectl delete pods all --grace-period=0 --force;
```

# Watch out, your stateful sets aren't guaranteed to be assigned the same node on restart
This can lead to an issue when restarting clusters for an update (i.e: new kube version). I will create an automated fix for this when I have more time but for now you can just kill your other pods so they get assigned to the right things. what lol



The majority of the yaml is based on:
https://pauldone.blogspot.com/2017/06/deploying-mongodb-on-kubernetes-gke25.html

The automatic configuration / pod introspection is written by me, which uses a different approach to configuring pods then scripts you have to call manually.

This fixes some of the bugs that were present in that yaml were a pain to figure out. Figured I would share. This also works locally with minikube (version 0.26) independent of google cloud.
