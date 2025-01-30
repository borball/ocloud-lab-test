
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

```yaml
[
  {
    "description": "Provisioning request for setting up a Single Node OpenShift (SNO) on sno132",
    ##### some attributes omitted, use Get ProvisionRequest by UUID to fetch all information
    "name": "sno132-cluster-provisioning",
    "provisioningRequestId": "48d22ac0-d0b2-4718-87bc-e07bb5c7ab7b",
    "status": {
      "provisionedResourceSets": {
        "nodeClusterId": "85b18b49-e86c-439a-a705-95027072164f"
      },
      "provisioningStatus": {
        "message": "Provisioning request has completed successfully",
        "provisioningPhase": "fulfilled",
        "updateTime": "2025-01-30T16:15:49Z"
      }
    }
  },
  {
    "description": "Provisioning request for setting up a Single Node OpenShift (SNO) on sno171",
    ##### some attributes omitted, use Get ProvisionRequest by UUID to fetch all information
    "name": "sno171-cluster-provisioning",
    "provisioningRequestId": "724db80d-11d8-4bac-9c23-2061022e041d",
    "status": {
      "provisionedResourceSets": {
        "nodeClusterId": "446c0c9f-556d-4ba4-ba30-df1bc5a2ccba"
      },
      "provisioningStatus": {
        "message": "Provisioning request has completed successfully",
        "provisioningPhase": "fulfilled",
        "updateTime": "2025-01-30T16:15:49Z"
      }
    }
  }
]
```

- Get ProvisionRequest by UUID
```shell
curl -k -H "Authorization: Bearer ${MY_TOKEN}" https://o2ims.apps.hub2.outbound.vz.bos2.lab/o2ims-infrastructureProvisioning/v1/provisioningRequests/48d22ac0-d0b2-4718-87bc-e07bb5c7ab7b
```

```yaml
{
  "description": "Provisioning request for setting up a Single Node OpenShift (SNO) on sno132",
  "extensions": {
    "clusterDetails": {
      "clusterProvisionStartedAt": "2025-01-28T22:00:12Z",
      "name": "sno132",
      "ztpStatus": "ZTP Done"
    },
    "policies": [
      {
        "compliant": "Compliant",
        "policyName": "net-mb-vdu2-4.16.28-net-configs",
        "policyNamespace": "ztp-oran-vdu-v4-16-28",
        "remediationAction": "enforce"
      },
      {
        "compliant": "Compliant",
        "policyName": "ptp-mb-vdu2-4.16.28-ptp-configs",
        "policyNamespace": "ztp-oran-vdu-v4-16-28",
        "remediationAction": "enforce"
      },
      {
        "compliant": "Compliant",
        "policyName": "vdu-base-vdu2-4.16.28-cluster-configs",
        "policyNamespace": "ztp-oran-vdu-v4-16-28",
        "remediationAction": "enforce"
      },
      {
        "compliant": "Compliant",
        "policyName": "vdu-base-vdu2-4.16.28-net-configs",
        "policyNamespace": "ztp-oran-vdu-v4-16-28",
        "remediationAction": "enforce"
      },
      {
        "compliant": "Compliant",
        "policyName": "vdu-base-vdu2-4.16.28-operator-catalogs",
        "policyNamespace": "ztp-oran-vdu-v4-16-28",
        "remediationAction": "enforce"
      },
      {
        "compliant": "Compliant",
        "policyName": "vdu-base-vdu2-4.16.28-operator-subs",
        "policyNamespace": "ztp-oran-vdu-v4-16-28",
        "remediationAction": "enforce"
      },
      {
        "compliant": "Compliant",
        "policyName": "acc100-vdu2-4.16.28-operator-config",
        "policyNamespace": "ztp-oran-vdu-v4-16-28",
        "remediationAction": "enforce"
      },
      {
        "compliant": "Compliant",
        "policyName": "acc100-vdu2-4.16.28-operator-subs",
        "policyNamespace": "ztp-oran-vdu-v4-16-28",
        "remediationAction": "enforce"
      }
    ]
  },
  "name": "sno132-cluster-provisioning",
  "provisioningRequestId": "48d22ac0-d0b2-4718-87bc-e07bb5c7ab7b",
  "status": {
    "provisionedResourceSets": {
      "nodeClusterId": "85b18b49-e86c-439a-a705-95027072164f"
    },
    "provisioningStatus": {
      "message": "Provisioning request has completed successfully",
      "provisioningPhase": "fulfilled",
      "updateTime": "2025-01-30T06:29:11Z"
    }
  },
  "templateName": "cluster-template-vdu2-general-4-16-28",
  "templateParameters": {
    "clusterInstanceParameters": {
      "clusterName": "sno132",
      "extraLabels": {
        "ManagedCluster": {
          "acc100": "",
          "cluster-version": "v4.16",
          "configuration-version": "vdu2-4.16.28",
          "scenario": "mb",
          "vdu-base": ""
        }
      },
      "machineNetwork": [
        {
          "cidr": "192.168.14.0/27"
        }
      ],
      "nodes": [
        {
          "bmcAddress": "redfish-virtualmedia://192.168.14.132/redfish/v1/Systems/1",
          "bmcCredentialsDetails": {
            "password": "UmVkaGF0MTIzIQ==",
            "username": "QWRtaW5pc3RyYXRvcg=="
          },
          "bootMACAddress": "b4:96:91:d1:f2:34",
          "hostName": "sno132.outbound.vz.bos2.lab",
          "nodeNetwork": {
            "config": {
              "dns-resolver": {
                "config": {
                  "search": [
                    "outbound.vz.bos2.lab"
                  ],
                  "server": [
                    "192.168.58.15"
                  ]
                }
              },
              "interfaces": [
                {
                  "ipv4": {
                    "address": [
                      {
                        "ip": "192.168.14.25",
                        "prefix-length": 27
                      }
                    ],
                    "dhcp": false,
                    "enabled": true
                  },
                  "ipv6": {
                    "dhcp": false,
                    "enabled": false
                  },
                  "name": "ens1f0",
                  "type": "ethernet"
                }
              ],
              "routes": {
                "config": [
                  {
                    "destination": "0.0.0.0/0",
                    "next-hop-address": "192.168.14.1",
                    "next-hop-interface": "ens1f0",
                    "table-id": 254
                  }
                ]
              }
            },
            "interfaces": [
              {
                "macAddress": "b4:96:91:d1:f2:34",
                "name": "ens1f0"
              }
            ]
          },
          "rootDeviceHints": {
            "deviceName": "/dev/disk/by-path/pci-0000:c2:00.0-nvme-1"
          }
        }
      ]
    },
    "nodeClusterName": "sno132",
    "oCloudSiteId": "rh-bos2-sno132",
    "policyTemplateParameters": {
      "cpufreq": "2700000",
      "lvs-id": "pci-0000:c3:00.0-nvme-1"
    }
  },
  "templateVersion": "v1"
}
```
- Delete ProvisionRequest with given UUID

```shell
curl -k -H "Authorization: Bearer ${MY_TOKEN}" -X DELETE https://o2ims.apps.hub2.outbound.vz.bos2.lab/o2ims-infrastructureProvisioning/v1/provisioningRequests/48d22ac0-d0b2-4718-87bc-e07bb5c7ab7b

```

- Create ProvisionRequest request
```shell
curl -k -X POST -H "Authorization: Bearer ${MY_TOKEN}" -H "Content-Type: application/json" https://o2ims.apps.hub2.outbound.vz.bos2.lab/o2ims-infrastructureProvisioning/v1/provisioningRequests -d @sno171-request.json  

```