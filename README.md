neutron-network ansible role
============================

The purpose of this role is to deploy neutron-network onto Ubuntu. 

Role Variables
--------------

- openstack_rabbitmq_host: 127.0.0.1
- openstack_rabbitmq_port: 5672
- openstack_log_verbose: true
- openstack_log_debug: false
- openstack_network_external_device: eth0
- openstack_network_external_name: public
- openstack_network_external_network: 10.1.0.0/16
- openstack_network_external_gateway: 10.1.0.1
- openstack_network_external_dns_servers: 8.8.8.8
- openstack_network_external_allocation_pool_start: 10.1.0.100
- openstack_network_external_allocation_pool_end: 10.1.0.200
- openstack_identity_region: RegionOne

Example Playbook
-------------------------

    - hosts: all
      sudo: True
      roles:
        - neutron-network

License
-------

GPLv2

Author Information
------------------

http://stillwell.me
