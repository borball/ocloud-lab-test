
##

Create SA for API client

```shell
oc apply -f https://raw.githubusercontent.com/openshift-kni/oran-o2ims/refs/heads/main/config/testing/client-service-account-rbac.yaml
```

Create token:

```shell
export MY_TOKEN=$(oc create token -n oran-o2ims test-client --duration=24h)

```