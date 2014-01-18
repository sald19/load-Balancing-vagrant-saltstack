# -*- mode: yalm -*-
# vi: set ft= yaml :

source:
    file:
        - managed
        - name: /etc/apt/sources.list.d/haproxy.list
        - source: salt://haproxy/haproxy.list
        - user: root
        - group: root
        - mode: 644
        - exists: test -f /etc/apt/sources.list.d/haproxy.list

#         - exists
#         - name: /etc/apt/sources.list.d/haproxy.list

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

