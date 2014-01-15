# -*- mode: yalm -*-
# vi: set ft= yaml :

source:
    file.managed:
        - name: /etc/apt/sources.list.d/haproxy.list
        - source: salt://haproxy/haproxy.list
        - user: root
        - group: root
        - mode: 644

update:    
    cmd.run:    
        - name: apt-get -y update
        - user: root
        - group: root
        - required:
            - file: source

haproxy:
    pkg:
        - installed
        - required:
            - cmd: update

    service:
        - running
        - enable: True
    
#sed -i "s/ENABLED=0/ENABLED=1/" /etc/default/haproxy:
#    cmd.run:
#        - required:
#            - pkg: haproxy

#save_default_config:
#    cmd.run:
#        - name: mv /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.original
#        - required:
#            - pkg: haproxy
