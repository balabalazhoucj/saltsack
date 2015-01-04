apache-install:
  file.managed:
    - name: /usr/local/src/httpd-2.2.27.tar.gz
    - source: salt://apache/files/httpd-2.2.27.tar.gz
    - user: root
    - group: root
    - mode: 644
  cmd.run:
    - name: cd /usr/local/src && tar zxf httpd-2.2.27.tar.gz && cd httpd-2.2.27 &&./configure --prefix=/usr/local/httpd --with-mpm=prefork --enable-so --enable-modules="all" --enable-mods-shared="all" --with-ssl --with-zlib --with-pcre  && make && make install
    - unless: test -d /usr/local/httpd
    - require:
      - file: apache-install
apache-conf:
  file.managed:
    - name: /usr/local/httpd/conf/httpd.conf
    - source: salt://apache/files/httpd.conf
    - user: root
    - group: root
