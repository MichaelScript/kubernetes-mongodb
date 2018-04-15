/usr/bin/openssl rand -base64 741 > mongosecret
kubectl create secret generic mongosecret --from-file=mongosecret
rm mongosecret