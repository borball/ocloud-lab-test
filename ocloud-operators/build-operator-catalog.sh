#!/bin/bash

workspace=$(mktemp -d)

cd $workspace

podman rmi quay.io/bzhai/oran-operator-catalog:v0.0.1
podman rmi quay.io/bzhai/oran-operator-catalog:v0.0.2
podman rmi quay.io/bzhai/oran-operator-catalog:v4.16

#siteconfig operator
git clone git@github.com:stolostron/siteconfig.git
cd siteconfig

podman rmi quay.io/bzhai/siteconfig-operator-bundle:v2.12.0

make build docker-build docker-push IMAGE_TAG_BASE=quay.io/bzhai/siteconfig-operator CONTAINER_TOOL=podman  
make bundle bundle-build bundle-push IMAGE_TAG_BASE=quay.io/bzhai/siteconfig-operator CONTAINER_TOOL=podman

opm index add --container-tool podman --mode semver --tag quay.io/bzhai/oran-operator-catalog:v0.0.1 --bundles quay.io/bzhai/siteconfig-operator-bundle:v2.12.0

podman push quay.io/bzhai/oran-operator-catalog:v0.0.1

#oran ocloud manager operator
cd ..
git clone git@github.com:openshift-kni/oran-o2ims.git
cd oran-o2ims

podman rmi quay.io/bzhai/oran-o2ims-operator-bundle:4.16.0

make build docker-build docker-push IMAGE_TAG_BASE=quay.io/bzhai/oran-o2ims-operator CONTAINER_TOOL=podman
make bundle bundle-build bundle-push IMAGE_TAG_BASE=quay.io/bzhai/oran-o2ims-operator CONTAINER_TOOL=podman

opm index add --container-tool podman --mode semver --tag quay.io/bzhai/oran-operator-catalog:v0.0.2 --bundles quay.io/bzhai/oran-o2ims-operator-bundle:4.16.0 --from-index quay.io/bzhai/oran-operator-catalog:v0.0.1

podman push quay.io/bzhai/oran-operator-catalog:v0.0.2

# oran hwmgr plugin
cd ..
git clone git@github.com:openshift-kni/oran-hwmgr-plugin.git
cd oran-hwmgr-plugin
podman rmi quay.io/bzhai/oran-hwmgr-plugin-bundle:0.0.1
make build docker-build docker-push IMAGE_TAG_BASE=quay.io/bzhai/oran-hwmgr-plugin CONTAINER_TOOL=podman
make bundle bundle-build bundle-push IMAGE_TAG_BASE=quay.io/bzhai/oran-hwmgr-plugin CONTAINER_TOOL=podman
opm index add --container-tool podman --mode semver --tag quay.io/bzhai/oran-operator-catalog:v4.16 --bundles quay.io/bzhai/oran-hwmgr-plugin-bundle:0.0.1 --from-index quay.io/bzhai/oran-operator-catalog:v0.0.2

##oran hwmgr test plugin
#cd ..
#git clone git@github.com:openshift-kni/oran-hwmgr-plugin-test.git
#cd oran-hwmgr-plugin-test
#podman rmi quay.io/bzhai/oran-hwmgr-plugin-test-bundle:4.16.0
#
#make build docker-build docker-push IMAGE_TAG_BASE=quay.io/bzhai/oran-hwmgr-plugin-test CONTAINER_TOOL=podman
#make bundle bundle-build bundle-push IMAGE_TAG_BASE=quay.io/bzhai/oran-hwmgr-plugin-test CONTAINER_TOOL=podman
#opm index add --container-tool podman --mode semver --tag quay.io/bzhai/oran-operator-catalog:v4.16 --bundles quay.io/bzhai/oran-hwmgr-plugin-test-bundle:v0.0.1 --from-index quay.io/bzhai/oran-operator-catalog:v0.0.3

podman push quay.io/bzhai/oran-operator-catalog:v4.16

oc-mirror list operators --catalog quay.io/bzhai/oran-operator-catalog:v4.16

