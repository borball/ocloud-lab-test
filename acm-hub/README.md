# ACM Hub

## OpenShift Cluster as ACM Hub

A OpenShift cluster shall be created to act as an ACM hub, you can use whatever method to install the cluster, in our 
test we used a SNO(Single Node OpenShift) installed with ABI(Agent Based Installer). Following operators used by ACM 
have been installed together with the cluster deployment. 

```
NAME                                         DISPLAY                                      VERSION
advanced-cluster-management.v2.11.3          Advanced Cluster Management for Kubernetes   2.11.3
lvms-operator.v4.16.4                        LVM Storage                                  4.16.4
multicluster-engine.v2.6.3                   multicluster engine for Kubernetes           2.6.3
openshift-gitops-operator.v1.14.1            Red Hat OpenShift GitOps                     1.14.1
topology-aware-lifecycle-manager.v4.16.2     Topology Aware Lifecycle Manager             4.16.2
```

SiteConfig operator shall be enabled with command:

```shell
oc patch multiclusterhubs.operator.open-cluster-management.io multiclusterhub -n open-cluster-management --type json --patch '[{"op": "add", "path":"/spec/overrides/components/-", "value": {"name":"siteconfig","enabled": true}}]'
```

**Note**
The LVM storage operator is used as the storage solution on the SNO used in the test.

More details can be found here about the cluster setup: [Install OCP](sno-install/README.md).

## ACM Hub Configuration

Next we create a LVMCluster which will provide the persistent storage and storageclass, then we can create 
MultiClusterHub and AgentServiceConfig, some helper scripts can be found here: [ACM Hub Setup](acm-setup/README.md)

## ArgoCD and Github Repo integration

Next we prepare a git repo by following example here: [git-setup](https://github.com/openshift-kni/oran-o2ims/tree/main/docs/samples/git-setup)

Then we create argoCD project and application and integrate with github repo: [ArgoCD & Github Repo Integration](argocd-github-integration/README.md)

