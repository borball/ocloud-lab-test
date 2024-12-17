## Hub configuration

Create ArgoCD App projects:

```shell
oc apply -k ./
```

Install ArgoCD plugin:

```shell
oc patch argocd openshift-gitops -n openshift-gitops --type=merge --patch-file argocd-openshift-gitops-patch.json
```

Github and ArgoCD integration:

```shell
./argocd-github-ingegration.sh
```

Add deploy key on the repo on github.

** Notes:**

The repo integrated with ArgoCD https://github.com/borball/ocloud-manager-test is a private one.