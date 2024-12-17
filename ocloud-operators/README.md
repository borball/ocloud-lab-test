## Operators

Following operators are required in the ORAN solution:

- SiteConfig operator
- OCloud Manager operator
- Hardware Manager Plugin

Those operators have not been public available, we can build the operator images and catalog from source code:

```shell
./build-operator-catalog.sh
```

If you don't want to build the index by yourself, you can use quay.io/bzhai/oran-operator-catalog:v4.16

Install operators:

```shell
./install-opertators.sh
```

Uninstall operators:

```shell
./uninstall-opertators.sh
```