## Cluster Provisioning

1. Cluster with hardware template

```
oc apply -s sno171.yaml
```
   
2. Cluster without hardware template

```
oc apply -s sno132.yaml
```
3. Check status

```shell
oc get provisioningrequests.o2ims.provisioning.oran.org 724db80d-11d8-4bac-9c23-2061022e041d -o yaml
```

```yaml
apiVersion: o2ims.provisioning.oran.org/v1alpha1
kind: ProvisioningRequest
metadata:
creationTimestamp: "2025-01-28T23:28:58Z"
finalizers:
- provisioningrequest.o2ims.provisioning.oran.org/finalizer
  generation: 1
  name: 724db80d-11d8-4bac-9c23-2061022e041d
  resourceVersion: "99284029"
  uid: e888dd4b-99c2-4325-8eb2-a18affaab20a
  spec:
  description: Provisioning request for setting up a Single Node OpenShift (SNO) on
  sno171
  name: sno171-cluster-provisioning
  templateName: cluster-template-vdu2-xr8620t-4-16-25
  templateParameters:
  clusterInstanceParameters:
  clusterName: sno171
  extraLabels:
  ManagedCluster:
  acc200: ""
  cluster-version: v4.16
  configuration-version: vdu2-4.16.25
  scenario: mb
  vdu-base: ""
  machineNetwork:
   - cidr: 192.168.18.0/24
     nodes:
   - hostName: sno171.outbound.vz.bos2.lab
     nodeNetwork:
     config:
     dns-resolver:
     config:
     search:
     - outbound.vz.bos2.lab
     server:
     - 192.168.58.15
     interfaces:
     - ipv4:
     address:
     - ip: 192.168.18.55
     prefix-length: 24
     dhcp: false
     enabled: true
     ipv6:
     dhcp: false
     enabled: false
     name: ens1f0
     type: ethernet
     routes:
     config:
     - destination: 0.0.0.0/0
     next-hop-address: 192.168.18.1
     next-hop-interface: ens1f0
     table-id: 254
     rootDeviceHints:
     deviceName: /dev/disk/by-path/pci-0000:43:00.0-nvme-1
     nodeClusterName: sno171
     oCloudSiteId: rh-bos2-sno171
     policyTemplateParameters:
     cpufreq: "2700000"
     lvs-id: pci-0000:44:00.0-nvme-1
     templateVersion: v1
     status:
     conditions:
- lastTransitionTime: "2025-01-28T23:28:58Z"
  message: The provisioning request validation succeeded
  reason: Completed
  status: "True"
  type: ProvisioningRequestValidated
- lastTransitionTime: "2025-01-28T23:28:58Z"
  message: ClusterInstance rendered and passed dry-run validation
  reason: Completed
  status: "True"
  type: ClusterInstanceRendered
- lastTransitionTime: "2025-01-28T23:28:58Z"
  message: Cluster resources applied
  reason: Completed
  status: "True"
  type: ClusterResourcesCreated
- lastTransitionTime: "2025-01-28T23:28:58Z"
  message: Rendered Hardware template successfully
  reason: Completed
  status: "True"
  type: HardwareTemplateRendered
- lastTransitionTime: "2025-01-28T23:29:09Z"
  message: Created
  reason: Completed
  status: "True"
  type: HardwareProvisioned
- lastTransitionTime: "2025-01-28T23:29:09Z"
  message: Node configuration has been applied to the rendered ClusterInstance
  reason: Completed
  status: "True"
  type: HardwareNodeConfigApplied
- lastTransitionTime: "2025-01-28T23:29:09Z"
  message: Applied and processed ClusterInstance (sno171) successfully
  reason: Completed
  status: "True"
  type: ClusterInstanceProcessed
- lastTransitionTime: "2025-01-29T00:14:53Z"
  message: Provisioning completed
  reason: Completed
  status: "True"
  type: ClusterProvisioned
- lastTransitionTime: "2025-01-29T00:33:57Z"
  message: The configuration is up to date
  reason: Completed
  status: "True"
  type: ConfigurationApplied
  extensions:
  clusterDetails:
  clusterProvisionStartedAt: "2025-01-28T23:29:09Z"
  name: sno171
  ztpStatus: ZTP Done
  nodePoolRef:
  hardwareProvisioningCheckStart: "2025-01-28T23:28:59Z"
  name: sno171
  namespace: oran-hwmgr-plugin
  policies:
   - compliant: Compliant
     policyName: vdu-base-vdu2-4.16.25-operator-catalogs
     policyNamespace: ztp-oran-vdu-v4-16-25
     remediationAction: enforce
   - compliant: Compliant
     policyName: vdu-base-vdu2-4.16.25-operator-subs
     policyNamespace: ztp-oran-vdu-v4-16-25
     remediationAction: enforce
   - compliant: Compliant
     policyName: acc200-vdu2-4.16.25-operator-config
     policyNamespace: ztp-oran-vdu-v4-16-25
     remediationAction: enforce
   - compliant: Compliant
     policyName: acc200-vdu2-4.16.25-operator-subs
     policyNamespace: ztp-oran-vdu-v4-16-25
     remediationAction: enforce
   - compliant: Compliant
     policyName: net-mb-vdu2-4.16.25-net-configs
     policyNamespace: ztp-oran-vdu-v4-16-25
     remediationAction: enforce
   - compliant: Compliant
     policyName: ptp-mb-vdu2-4.16.25-ptp-configs
     policyNamespace: ztp-oran-vdu-v4-16-25
     remediationAction: enforce
   - compliant: Compliant
     policyName: vdu-base-vdu2-4.16.25-cluster-configs
     policyNamespace: ztp-oran-vdu-v4-16-25
     remediationAction: enforce
   - compliant: Compliant
     policyName: vdu-base-vdu2-4.16.25-net-configs
     policyNamespace: ztp-oran-vdu-v4-16-25
     remediationAction: enforce
     provisioningStatus:
     provisionedResources:
     oCloudNodeClusterId: 446c0c9f-556d-4ba4-ba30-df1bc5a2ccba
     provisioningDetails: Provisioning request has completed successfully
     provisioningPhase: fulfilled
     updateTime: "2025-01-30T22:53:44Z"
```