# -*- mode: yalm -*-
# vi: set ft= yaml :

base:
    '*':
        - vim

    'web0[1-2]':
        - nginx
        - nginx.sites

    'app01':
        - php
        - php.cli

    'haproxy':
        - haproxy
        - haproxy.config
