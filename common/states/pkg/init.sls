apache:
  pkg.installed:
    - name: {{ pillar['pkgs']['apache'] }}

openssh:
  pkg.installed:
    - name: openssh-server
