echo "
apiVersion: ${deployed.apiVersion}
kind: ${deployed.kind}
metadata:
  name: ${deployed.name}
  labels:
  <#list deployed.labels?keys as k>
    ${k}: ${deployed.labels[k]}
  </#list>
  annotations:
  <#list deployed.annotations?keys as k>
    ${k}: ${deployed.annotations[k]}
  </#list>
  <#if deployed.namespace??>namespace: ${deployed.namespace}</#if>
spec:
  type: ${deployed.serviceType}
  selector:
<#list deployed.selector?keys as k>
    ${k}: ${deployed.selector[k]}
</#list>
  ports:
<#list deployed.ports as port>
  - port: ${port.port}
    name: port-${port.name}
    <#if port.targetPort??>targetPort: ${port.targetPort}</#if>
    <#if port.nodePort??>nodePort: ${port.nodePort}</#if>
</#list>
" > service.yaml

cat service.yaml
<#include "/xldk8s/setup.ftl">
kubectl apply -f service.yaml
