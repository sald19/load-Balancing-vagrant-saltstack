# -*- mode: yalm -*-
# vi: set ft= yaml :

base:
    '*':
        - vim

    'web0[1-2]':
        - webserver

    'haproxy':
        - haproxy
        - haproxy.config
