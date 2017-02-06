==============
Sahara formula
==============

The Sahara project provides a simple means to provision a data-intensive application cluster (Hadoop or Spark) on top of OpenStack.


Sample pillars
==============

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
=====

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


External links
==============

* http://docs.openstack.org/developer/sahara/userdoc/vanilla_plugin.html
* http://docs.openstack.org/developer/sahara/devref/quickstart.html
* http://docs.openstack.org/developer/sahara/horizon/installation.guide.html


Documentation and Bugs
======================

To learn how to install and update salt-formulas, consult the documentation
available online at:

    http://salt-formulas.readthedocs.io/

In the unfortunate event that bugs are discovered, they should be reported to
the appropriate issue tracker. Use Github issue tracker for specific salt
formula:

    https://github.com/salt-formulas/salt-formula-sahara/issues

For feature requests, bug reports or blueprints affecting entire ecosystem,
use Launchpad salt-formulas project:

    https://launchpad.net/salt-formulas

You can also join salt-formulas-users team and subscribe to mailing list:

    https://launchpad.net/~salt-formulas-users

Developers wishing to work on the salt-formulas projects should always base
their work on master branch and submit pull request against specific formula.

    https://github.com/salt-formulas/salt-formula-sahara

Any questions or feedback is always welcome so feel free to join our IRC
channel:

    #salt-formulas @ irc.freenode.net
