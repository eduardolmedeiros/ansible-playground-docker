# Ansible Playground docker image

This is a docker image for ansible playground.
Tests your playbooks and roles in a safe place, without breaking stuff.

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

## 1. How to use?

### 1.1 via docker cli (1st option)

```
$ docker run --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro -d --name ansible-playground emedeiros/ansible-playground
$ docker exec -it ansible-playground bash
$ docker stop ansible-playground
```

### 1.2 via docker-compose (2nd option)

```
$ docker-compose up -d
$ docker-compose exec ansible-playground bash
$ docker-compose stop
```

### 1.3 samples

```
$ docker-compose exec ansible-playground bash

(.env) [root@3f2fc25468cb /]# ansible --version
ansible 2.10.2
  config file = None
  configured module search path = ['/root/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /opt/ansible/.env/lib64/python3.6/site-packages/ansible
  executable location = /opt/ansible/.env/bin/ansible
  python version = 3.6.8 (default, Apr 16 2020, 01:36:27) [GCC 8.3.1 20191121 (Red Hat 8.3.1-5)]


(.env) [root@3f2fc25468cb /]# ansible localhost -c local -m command -a uptime
[WARNING]: No inventory was parsed, only implicit localhost is available
localhost | CHANGED | rc=0 >>
 16:28:20 up  6:55,  0 users,  load average: 0.07, 0.13, 0.15
  ```


## 2. Need to apply some changes? just build a local docker image

```
$ git clone https://github.com/eduardolmedeiros/ansible-playground-docker.git
$ docker build -t local/ansible-playground:<tag> .
```
