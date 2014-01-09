# -*- mode: yalm -*-
# vi: set ft= yaml :

nginx:
    pkg:
        - installed

    service:
        - running
        - enable: True
