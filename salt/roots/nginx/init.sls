# -*- mode: yalm -*-
# vi: set ft= yaml :

nginx:
    pkg:
        - installed

    service:
        - running
        - enable: True

upstreams.conf:
    file:
        - managed
        - name: /etc/nginx/conf.d/upstreams.conf
        - source: salt://nginx/upstreams.conf
        - user: root
        - group: root
        - mode: 644
        - require:
            - pkg: nginx
