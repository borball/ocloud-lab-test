## ACM Hub Configuration

```shell
oc apply -k ./extra-manifest

oc wait --for condition=established crd agentserviceconfigs.agent-install.openshift.io --timeout=180s

oc patch storageclass lvms-vg1 -p '{"metadata": {"annotations": {"storageclass.kubernetes.io/is-default-class": "true"}}}'

oc apply -f ./extra-manifests/AgentServiceConfig.yaml

oc get pods -n multicluster-engine -w

```