add_jenkins_aptkey:
  cmd.run:
    - name: wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -
    - onlyif:
      - test `apt-key list |grep D50582E6|wc -l` -eq 0

add_jenkins_sourcelist:
  cmd.run:
    - name: echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list
    - unless:
      - test -f /etc/apt/sources.list.d/jenkins.list
    - require: 
      - cmd: add_jenkins_aptkey

update_repo:
  cmd.run:
    - name: apt-get update
    - require:
      - cmd: add_jenkins_sourcelist

jenkins:
  pkg.latest:
    - require:
      - cmd: update_repo
