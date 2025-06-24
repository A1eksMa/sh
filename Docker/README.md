# Docker
Installation guide from official dockerdocs [Install Docker Engine on Debian](https://docs.docker.com/engine/install/debian/)

Use `docker_installer.sh` script to run all steps below. The script requires root or sudo privileges.

## Uninstall all conflicting packages
```bash
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done
```

## Add Docker's official GPG key:
```bash
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
```

## Add the repository to Apt sources:
```bash
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

## To install the latest version
```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

## Verify that the installation is successful by running the `hello-world` image
```bash
sudo docker run hello-world
```
This command downloads a test image and runs it in a container. When the container runs, it prints a confirmation message and exits.

## Troubleshooting

Sometimes (Raspberry Pi OS 64-bit, based on Debian) it needs to configure DNS-servers. Add it to `/etc/resolv.conf`:

```/etc/resolv.conf
nameserver 8.8.8.8
nameserver 8.8.4.4
```




