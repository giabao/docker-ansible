# sansible
simple docker file based on ubuntu:16.04 + ansible 2.x + sudo

1. Run:
assume you have ansible stuffs in /opt/giabao/wd/sandinh-ansible/{roles, playbook} 
```
cd /opt/giabao/wd/sandinh-ansible
docker run --rm -it \
    -v $PWD/roles:/etc/ansible/roles \
    -v $PWD/playbook:/playbook \
    -v $HOME/.ssh:/home/sandinh/.ssh \
    sandinh/ansible
```
Or, you can use the [sansible](sansible) script:
```
sudo wget -O /usr/bin/sansible https://raw.githubusercontent.com/giabao/docker-ansible/master/sansible
sudo chmod a+x /usr/bin/sansible
sansible /opt/giabao/wd/sandinh-ansible
```
2. Then run ansible in the container as normal, ex:
```
ansible -m setup all
ansible-playbook -i prod myplaybook.yml
```

## build docker image locally
```
git clone git@github.com:giabao/docker-ansible.git
docker build --rm -t sandinh/ansible docker-ansible
```

## Licence
This software is licensed under the Apache 2 license:
http://www.apache.org/licenses/LICENSE-2.0

Copyright 2016 Sân Đình (http://sandinh.com)
