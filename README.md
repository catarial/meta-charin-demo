# Build Environment Setup

This project uses a tool called [kas](https://github.com/siemens/kas)
to build the yocto image. It requires a Linux environment to have a
consistent build. I've tried using Podman/Docker on MacOS, but ran into
some issues with how the image interacts with the file system. I haven't
tested with WSL or Podman/Docker on Windows yet.

To use `kas` without a container, setup your build environment as
described in the [yocto quick build page](https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html)
and install `kas`. [kas install guide](https://kas.readthedocs.io/en/latest/userguide/getting-started.html)

To use `kas` with a container, install Docker/Podman then use the `kas-container` script
in the `kas` repo instead of `kas`.

# Building The Project

Make a workdir

```
mkdir charin-demo
cd charin-demo
```

Clone the repo in the workdir

```
git clone https://github.com/catarial/meta-charin-demo
```

Run kas

```
<path to kas/kas-container> build meta-charin-demo/config.yml
```

# Missing Directory Issue

You might need to create `/usr/include/python3.11` if it doesn't exist
on your system or container. The build doesn't add anything to
that directory, it just fails if it doesn't see it.

# State Directory

I included files that have not been integrated into the build process
yet in the state directory. This includes configs for everest and
wpa\_supplicant.

After you flash your image you need to copy over these files manually.
Connect over ethernet, (charger's ethernet address is set to 192.168.1.100).
Copy `umwc-wifi.conf` to `/etc/wpa_supplicant.conf`, `wpa_supplicant.service`
and `everest.service` to `/usr/lib/systemd/system`, and copy the everest
config you want to `/etc/config-charin.yaml`



