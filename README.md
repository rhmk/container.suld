# container.suld

Container with Samsung unified linux driver

Build:

```bash
podman build . -t <tag>
```

Run:

```bash
podman run -it -v /Users:/mnt/Users --name suld39 -h suld39 --arch=x86_64 quay.io/mkoch-redhat/suld:f39 /bin/bash
```
