FROM ansible/ubuntu14.04-ansible:stable
MAINTAINER Mark Stillwell <mark@stillwell.me>

COPY . /var/cache/docker/neutron-network
WORKDIR /var/cache/docker/neutron-network

RUN if [ ! -f playbooks/group_vars/all.yml ]; then \
      mkdir -p playbooks/group_vars;\
      ln -s ../../defaults/main.yml playbooks/group_vars/all.yml;\
    fi
RUN ansible-playbook -i inventories/local.ini playbooks/install.yml

VOLUME [ "/etc/neutron", "/var/lib/neutron", "/var/run/neutron", \
         "/var/lock/neutron", "/var/log/neutron", "/var/log/supervisor" ]

CMD [ "/usr/bin/supervisord" ]

EXPOSE 9696
