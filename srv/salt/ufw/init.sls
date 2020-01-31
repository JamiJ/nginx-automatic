ufw:
  pkg.installed

/etc/ufw/user.rules:
 file:
  - managed
  - source: salt://ufw/user.rules
  - require:
    - pkg: ufw

/etc/ufw/user6.rules:
 file:
  - managed
  - source: salt://ufw/user6.rules
  - require:
    - pkg: ufw

ufw_enable:
 cmd.run:
  - name: 'sudo ufw --force enable'
