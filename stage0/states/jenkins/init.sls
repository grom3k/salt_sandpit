jenkins_aptkey:
  cmd.run:
    - name: wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -
    - onlyif:
      - test `apt-key list |grep D50582E6|wc -l` -eq 0

jenkins_repo:
  cmd.run:
    - name: echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list
    - unless:
      - test -f /etc/apt/sources.list.d/jenkins.list
    - require: 
      - cmd: jenkins_aptkey

update_repo:
  cmd.wait:
    - name: apt-get update
    - require:
      - cmd: jenkins_repo

jenkins_install:
  pkg.installed:
    - name: {{ salt['pillar.get']('jenkins_pkg:lookup:name') }}
    - version: {{ salt['pillar.get']('jenkins_pkg:lookup:version') }}
    - watch_in:
      - cmd: update_repo

