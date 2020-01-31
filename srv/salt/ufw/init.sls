ufw:
  pkg.installed

/etc/ufw/user.rules:
 file:
  - managed
  - source: salt://ufw/user.rules
  - require:
    - pkg: ufw

ufw_enable:
 cmd.run:
  - name: 'sudo ufw enable'
