# Ansible Playground docker image

This is a dummy container for ansible playground.

### Requirement

* docker
* docker-compose (optional)


### Features

* centos 8 latest
* systemd support
* python 3
* python environment (install dir: /opt/ansible/.env)
* ansible latest version
* molecule latest version


### Building a docker image

```
git clone https://github.com/eduardolmedeiros/ansible-playground-docker.git
docker build -t emedeiros/ansible-playground:<tag> .
```

## 1. How to use?

### 1.1 via docker cli (1st option)

```
docker run --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro -d --name ansible-playground emedeiros/ansible-playground
docker exec -it ansible-playground bash
docker stop ansible-playground
```

### 1.2 via docker-compose (2nd option)

```
docker-compose up -d
docker-compose exec ansible-playground bash
docker-compose stop
```

# 2. Building a local image
```
docker build -f Dockerfile -t emedeiros/ansible-playground .
```