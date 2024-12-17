podman run -it -d -p 1080:1080 -v ./config:/config:Z --env MOCKSERVER_INITIALIZATION_JSON_PATH=/config/data.json quay.io/bzhai/mockserver:5.14.0
