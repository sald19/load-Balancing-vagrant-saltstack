include:
    - haproxy

exclude:
    - id: update

extend:
    haproxy:
        service:
            - running
            - enable: True
            - watch:
                - file: config 

postinstall:
    cmd.script:
        - source: salt://haproxy/postinstall.sh
        - user: root
        - shell: /bin/bash
        - required:
            - pkg: haproxy
        - unless: test -f /etc/haproxy/haproxy.cfg.original

config:
    file:
        - managed
        - name: /etc/haproxy/haproxy.cfg
        - source: salt://haproxy/haproxy.cfg
        - user: root
        - group: root
        - mode: 644
