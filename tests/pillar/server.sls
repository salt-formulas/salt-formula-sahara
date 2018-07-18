sahara:
  server:
    enabled: true
    version: ocata
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