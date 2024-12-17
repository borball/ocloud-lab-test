## OCP Installation

We use repo [sno-agent-based-installer](https://github.com/borball/sno-agent-based-installer) to install a SNO running on a KVM.

```shell
git clone git@github.com:borball/sno-agent-based-installer.git
cd sno-agent-based-installer/test/
./test-hub.sh
```

The script above deployed a SNO and installed ACM hub required operators:

```shell
# oc get node
NAME                        STATUS   ROLES                         AGE   VERSION
hub2.outbound.vz.bos2.lab   Ready    control-plane,master,worker   26m   v1.29.8+632b078

# oc get clusterversion
NAME      VERSION   AVAILABLE   PROGRESSING   SINCE   STATUS
version   4.16.19   True        False         10m     Cluster version is 4.16.19
```

```
NAME                                         DISPLAY                                      VERSION
advanced-cluster-management.v2.11.3          Advanced Cluster Management for Kubernetes   2.11.3
lvms-operator.v4.16.4                        LVM Storage                                  4.16.4
multicluster-engine.v2.6.3                   multicluster engine for Kubernetes           2.6.3
openshift-gitops-operator.v1.14.1            Red Hat OpenShift GitOps                     1.14.1
topology-aware-lifecycle-manager.v4.16.2     Topology Aware Lifecycle Manager             4.16.2
```
