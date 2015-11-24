base:
  '*':
    - users
    - user_settings
    - ssh
    - git
  'isftp:true':
    - match: grain
    - pkgs

qa:
  '*':
    - jenkins

monitoring:
  '*': []
