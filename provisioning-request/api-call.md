
## API Usage

Create SA for API client

```shell
oc apply -f https://raw.githubusercontent.com/openshift-kni/oran-o2ims/refs/heads/main/config/testing/client-service-account-rbac.yaml
```

Create token:

```shell
export MY_TOKEN=$(oc create token -n oran-o2ims test-client --duration=24h)
```

API call:

- Get API version

```shell
curl https://o2ims.apps.hub2.outbound.vz.bos2.lab/o2ims-infrastructureProvisioning/v1/api_versions  -H "Authorization: Bearer ${MY_TOKEN}" -k
{"apiVersions":[{"version":"1.0.0"}],"uriPrefix":"/o2ims-infrastructureProvisioning/v1"}


```

- Get all ProvisionRequests

```shell
curl -k -H "Authorization: Bearer ${MY_TOKEN}" https://o2ims.apps.hub2.outbound.vz.bos2.lab/o2ims-infrastructureProvisioning/v1/provisioningRequests 

```

- Get ProvisionRequest by UUID
```shell
curl -k -H "Authorization: Bearer ${MY_TOKEN}" https://o2ims.apps.hub2.outbound.vz.bos2.lab/o2ims-infrastructureProvisioning/v1/provisioningRequests/48d22ac0-d0b2-4718-87bc-e07bb5c7ab7b 

```

- Delete ProvisionRequest with given UUID

```shell
curl -k -H "Authorization: Bearer ${MY_TOKEN}" -X DELETE https://o2ims.apps.hub2.outbound.vz.bos2.lab/o2ims-infrastructureProvisioning/v1/provisioningRequests/48d22ac0-d0b2-4718-87bc-e07bb5c7ab7b

```

- Create ProvisionRequest request
```shell
curl -k -X POST -H "Authorization: Bearer ${MY_TOKEN}" -H "Content-Type: application/json" https://o2ims.apps.hub2.outbound.vz.bos2.lab/o2ims-infrastructureProvisioning/v1/provisioningRequests -d @sno171-request.json  

```