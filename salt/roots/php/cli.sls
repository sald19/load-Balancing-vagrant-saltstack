{% from "php/map.jinja" import php with context %}

php-fpm:
  pkg:
    - installed
    - name: {{ php.cli_pkg }}
  service:
    - running
    - name: {{ php.fpm_service }}
    - enable: True
