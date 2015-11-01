include:
  - pkg 

/root/.ssh:
  file.directory:
    - name: /root/.ssh
    - user: root
    - group: root
    - mode: 600
    - require:
      - pkg: openssh-server

/root/.ssh/authorized_keys:
  file.managed:
    - user: root
    - group: root
    - mode: 600
    - source: salt://ssh/authorized_keys
    - require:
      - file: /root/.ssh
