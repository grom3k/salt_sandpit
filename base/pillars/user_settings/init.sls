bash_rc:
  {% if grains['role'] == 'monitor' %}
  ps1_suffix: \e[0;33mMON\e[0m
  vim: vim
{% endif %}
