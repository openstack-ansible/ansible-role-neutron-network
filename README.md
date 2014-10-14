marklee77.neutron-network
=========================

[![Build Status](https://travis-ci.org/marklee77/ansible-role-neutron-network.svg?branch=master)](https://travis-ci.org/marklee77/ansible-role-neutron-network)

The purpose of this role is to deploy neutron-network onto Ubuntu. There is
also support for an experimental "dockerized" deployment. This dockerized
deployment copies the role to the target machine and uses the original
ansible-based functionality to build a docker image, and then uses recent
ansible features to manage the running service. The dockerized deployment can
theoretically deploy to any Linux platform with a running docker install and
the docker-py python client library installed.

Travis status above refers only to the non-dockerized deployment, as docker does 
not (easily) run on travis.

Role Variables
--------------

The variables below only affect the dockerized deployment:

- neutron_network_dockerized_deployment: false
- neutron_network_docker_username: default
- neutron_network_docker_imagename: neutron-network
- neutron_network_docker_containername: nova

Example Playbook
-------------------------

    - hosts: all
      sudo: True
      roles:
        - marklee77.neutron-network

License
-------

GPLv2

Author Information
------------------

http://stillwell.me

Known Issues
------------

- the dockerized deployment still requires sudo access, even though a member of 
  the docker group should be able to build and deploy containers without sudo.

Todo
----

- metadata...
- separate nova-api from neutron-network?
- delegate_to in order to allow for installing on hosts different from neutron-network host...
- consider making mapping of neutron-network port to host interface optional
- eventually, we're going to need a better way to pass in variables...
