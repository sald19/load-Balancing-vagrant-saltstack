include:
    - haproxy

#extend:
#    haproxy:
#        service:
#            - running
#            - enable: True
#            - watch:
#                - file: config 

sed -i "s/ENABLED=0/ENABLED=1/" /etc/default/haproxy:
    cmd.run:
        - required:
            - pkg: haproxy

save_default_config:
    cmd.run:
        - name: if [ ! -f /etc/haproxy/haproxy.cfg.original ]; then mv /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.original; fi 
        - requireid:
            - pkg: haproxy

config:
    file:
        - managed
        - name: /etc/haproxy/haproxy.cfg
        - source: salt://haproxy/haproxy.cfg
        - user: root
        - group: root
        - mode: 644
        - watch:
            - service: haproxy
