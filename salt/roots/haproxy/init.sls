# -*- mode: yalm -*-
# vi: set ft= yaml :

haproxy:
    pkg:
        - installed

    service:
        - running
        - enable: True
    
date > /tmp/test:
    cmd.run
