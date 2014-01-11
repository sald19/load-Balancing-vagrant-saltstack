# -*- mode: yalm -*-
# vi: set ft= yaml :

vim:
    pkg:
        - installed

/root/.vimrc:
    file.managed:
        - source: salt://vim/.vimrc
        - require:
            - pkg: vim
