ekg:
 pkg.installed

/tmp/gucio:
 file.managed:
  - source: salt://files/gucio.file
  - mode: 777
  - user: pi
  - group: pi
