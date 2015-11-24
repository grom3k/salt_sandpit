/root/.bashrc:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://user_settings/.bash_rc
    - template: jinja
