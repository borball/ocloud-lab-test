## SMO Mock Server

Install mock SMO server:

```shell
./mock.sh
```

Register the SMO into ocloud manager:

```shell
oc patch inventory -n oran-o2ims default --type merge --patch '{"spec":{"cloudID":"9aa34769-4a07-44ad-a14a-f9127d55eb34", "smo": {"url":"http://192.168.58.15:1080", "registrationEndpoint":"/smo/v1/ocloud_observer"}}}'
```

