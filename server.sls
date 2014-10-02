{%- from "sahara/map.jinja" import server with context %}
{%- if server.enabled %}

include:
- git
- python
- supervisor

sahara_packages:
  pkg.installed:
  - names: {{ server.pkgs }}

/srv/sahara:
  virtualenv.manage:
  - system_site_packages: True
  - requirements: salt://sahara/files/requirements.txt
  - require:
    - pkg: sahara_packages

sahara_user:
  user.present:
  - name: sahara
  - system: True
  - home: /srv/sahara
  - require:
    - virtualenv: /srv/sahara

/var/log/sahara:
  file.directory:
  - user: sahara
  - group: sahara
  - mode: 755
  - makedirs: true

sahara_etc_dir:
  file.directory:
  - name: /srv/sahara/etc
  - require:
    - virtualenv: /srv/sahara

/srv/sahara/etc/sahara.conf:
  file.managed:
  - source: salt://sahara/files/sahara.conf.icehouse
  - template: jinja
  - require:
    - file: sahara_etc_dir

sahara_install_database:
  cmd.run:
  - name: /srv/sahara/bin/sahara-db-manage --config-file /srv/sahara/etc/sahara.conf
  - require:
    - file: /srv/sahara/etc/sahara.conf

{%- endif %}