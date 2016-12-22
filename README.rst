========================
Sahara Data Processing
========================

Sample pillar
================

.. code-block:: yaml

    sahara:
      server:
        enabled: true
        version: kilo
        bind:
          host: 0.0.0.0
          port: 8386
        database:
          engine: mysql
          host: 127.0.0.1
          port: 3306
          name: sahara
          user: sahara
          password: password
        identity:
          engine: keystone
          protocol: http
          host: 127.0.0.1
          port: 35357
          tenant: sahara
          user: sahara
          password: password
        message_queue:
          engine: rabbitmq
          port: 5672
          members:
          - host: 192.168.1.13
          - host: 192.168.1.14
          - host: 192.168.1.15
          user: openstack
          password: supersecret
          virtual_host: '/openstack'

Usage
=======

Get Vanilla glance images

* http://sahara-files.mirantis.com/sahara-icehouse-vanilla-1.2.1-ubuntu-13.10.qcow2
* http://sahara-files.mirantis.com/sahara-juno-vanilla-1.2.1-ubuntu-14.04.qcow2
* http://sahara-files.mirantis.com/sahara-juno-vanilla-2.4.1-ubuntu-14.04.qcow2
* http://sahara-files.mirantis.com/sahara-juno-vanilla-1.2.1-centos-6.5.qcow2

Register image in sahara

.. code-block:: bash

    sahara image-register --image-id $IMAGE_ID --username ubuntu

    sahara image-add-tag --image-id $IMAGE_ID --tag vanilla
    sahara image-add-tag --image-id $IMAGE_ID --tag 1.2.1

Make sure that image is registered correctly

.. code-block:: bash

    sahara image-list


Read more
==========

* http://docs.openstack.org/developer/sahara/userdoc/vanilla_plugin.html
* http://docs.openstack.org/developer/sahara/devref/quickstart.html
* http://docs.openstack.org/developer/sahara/horizon/installation.guide.html
