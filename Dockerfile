FROM ubuntu:16.04

RUN \
  echo 'deb http://ppa.launchpad.net/ansible/ansible/ubuntu xenial main' > /etc/apt/sources.list.d/ansible.list && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7BB9C367 && \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y sudo ssh ansible rsync && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/*


RUN \
  adduser --disabled-password --gecos "" sandinh && \
  echo 'sandinh ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER sandinh

VOLUME ["/etc/ansible/roles", "/playbook"]

WORKDIR /playbook

CMD bash -l
