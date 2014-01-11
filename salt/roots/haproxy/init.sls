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

    service:
        - running
        - enable: True
        - required:
            - cmd: update
    

