echo "
apiVersion: ${deployed.apiVersion}
kind: ${deployed.kind}
metadata:
  name: ${deployed.namespaceName!deployed.name}

" > namespace.yaml

cat namespace.yaml
<#include "/xldk8s/setup.ftl">
kubectl apply -f namespace.yaml