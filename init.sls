
include:
{%- if pillar.sahara.server.enabled %}
- sahara.server
{%- endif %}
