# dyfi-update-raspbian
dyfi-update in a container

Create ``dyfi-update.conf`` based on the template ``dyfi-update.conf.TEMPLATE``

```shell
docker build -t local/dyfi-update .
docker run local/dyfi-update
```
