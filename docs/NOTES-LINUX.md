# Notes Linux

TODO: revisit, increase.

## Fish

Follow <https://github.com/kidonng/plug.fish#installation>

```shell
exec fish
plugin_update
```

## Other environments

For adding a new desktop create a new user and assign to wheel group. Don't forget to add the sudo config file
in the `sudoers.d` directory.

```shell
useradd -m -G wheel -s /bin/bash {{user}}
sudo passwd {{user}}
```
