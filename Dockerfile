FROM centos:8

LABEL maintainer="Eduardo Medeiros"

ENV container docker

# enable init support (systemd)
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

# install requirements packages
RUN dnf -y install python3 python3-pip git vim  && \
    dnf clean all

# setup ansible environment
RUN mkdir /opt/ansible && \
    cd /opt/ansible && \
    python3 -m venv .env && \
    .env/bin/pip3 install --upgrade pip && \
    .env/bin/pip3 install ansible molecule ansible-lint && \
    echo "source /opt/ansible/.env/bin/activate" >> /root/.bashrc

VOLUME [ "/sys/fs/cgroup" ]

CMD ["/sbin/init"]