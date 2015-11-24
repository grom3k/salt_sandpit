{% for user, uid in pillar.get('users', {}).items() %}
{{user}}:
  user.present:
    - uid: {{uid}}
{% endfor %}

{{ salt['pillar.get']('user_test:name') }}:
  user.present:
    - uid: {{ salt['pillar.get']('user_test:uid') }}

pliczek::
  file.managed:
    - name: /tmp/{{ grains['os'] }}
