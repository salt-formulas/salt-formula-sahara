{%- from "sahara/map.jinja" import server with context %}
{%- if server.enabled %}

sahara_packages:
  pkg.installed:
  - names: {{ server.pkgs }}

/etc/sahara/sahara.conf:
  file.managed:
  - source: salt://sahara/files/{{ server.version }}/sahara.conf.{{ grains.os_family }}
  - template: jinja
  - require:
    - pkg: sahara_packages

sahara_install_database:
  cmd.run:
  - name: sahara-db-manage --config-file /etc/sahara/sahara.conf upgrade head
  - require:
    - file: /etc/sahara/sahara.conf

sahara_server_services:
  service.running:
  - enable: true
  - names: {{ server.services }}
  - require:
    - cmd: sahara_install_database
  - watch:
    - file: /etc/sahara/sahara.conf

{%- endif %}