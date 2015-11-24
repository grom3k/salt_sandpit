{% for pkg in salt['pillar.get']('pkgs') %}
{{ pkg }}:
  pkg.installed: []
{% endfor %}


#openssh:
#  pkg.installed:
#    - name: openssh-server

nano:
  pkg.installed: []

{% if grains['isftp'] == 'false' %}
nginx:
  pkg.installed: []
{% endif %}
