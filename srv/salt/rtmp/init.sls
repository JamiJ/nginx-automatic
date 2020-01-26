install_packages:
  pkg.installed:
    - pkgs:
      - vlc
      - build-essential
      - libpcre3
      - libpcre3-dev
      - libssl-dev

run_wget_nginx:
  cmd.run:
    - name: wget http://nginx.org/download/nginx-1.15.1.tar.gz
    - cwd: /home/xubuntu/RTMP-phone/

run_rtmp_module:
  cmd.run:
    - name: wget https://github.com/sergey-dryabzhinsky/nginx-rtmp-module/archive/dev.zip
    - cwd: /home/xubuntu/RTMP-phone/

run_unpack:
  cmd.run:
    - name: tar -zxvf nginx-1.15.1.tar.gz
    - cwd: /home/xubuntu/RTMP-phone/

run_unzip:
  cmd.run:
    - name: unzip dev.zip
    - cwd: /home/xubuntu/RTMP-phone/

run_build_nginx:
  cmd.run:
    - name: ./configure --without-http_gzip_module --with-http_ssl_module --add-module=../nginx-rtmp-module-dev
    - cwd: /home/xubuntu/RTMP-phone/nginx-1.15.1/

run_make_nginx:
  cmd.run:
    - name: make
    - cwd: /home/xubuntu/RTMP-phone/nginx-1.15.1/

run_make_sudo:
  cmd.run:
    - name: sudo make install
    - cwd: /home/xubuntu/RTMP-phone/nginx-1.15.1/

/usr/local/nginx/conf/nginx.conf:
  file.managed:
    - source: salt://rtmp/nginx.conf

run_start_nginx:
  cmd.run:
    - name: sudo /usr/local/nginx/sbin/nginx
