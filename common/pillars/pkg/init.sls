pkgs:
  {% if grains['os_family'] == 'Debian' %}
  apache: apache2
  vim: vim
{% endif %}
