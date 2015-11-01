git:
  pkg.installed

/home/git:
  file.directory:
    - user: root
    - group: root
    - mode: 755
    - require:
      - pkg: git

initialize_bare_repo:
  cmd.run:
    - name: git init --b
    - cwd: /home/git
    - unless: git rev-parse --is-bare-repository
    - require:
      - file: /home/git
