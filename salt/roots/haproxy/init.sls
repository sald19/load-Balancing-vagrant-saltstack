# -*- mode: yalm -*-
# vi: set ft= yaml :

#source:
#    file:
#        - managed
#        - name: /etc/apt/sources.list.d/haproxy.list
#        - source: salt://haproxy/haproxy.list
#        - user: root
#        - group: root
#        - mode: 644

#update:    
#    cmd.run:    
#        - name: apt-get -y update
#        - user: root
#        - group: root
#        - required:
#            - file: source

preinstall:
    cmd.script:
        - source: salt://haproxy/sh/preinstall.sh
        - user: root
        - shell: /bin/bash
        - unless: test -f /etc/apt/sources.list.d/haproxy.list


haproxy:
    pkg:
        - installed
        - required:
            - cmd: update

