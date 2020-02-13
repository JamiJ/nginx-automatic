#Add new user stream
stream:
  user.present:
    - fullname: stream
    - shell: /bin/zsh
    - home: /home/stream
    - groups:
      - adm
      - sudo
    - password: streaming