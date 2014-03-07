{% from "php/map.jinja" import php with context %}
{% import_yaml "nginx/lib.sls" as sites %}

php:
  pkg:
    - installed
    - name: {{ php.fpm_pkg }}

{% for key, value in sites.items() %}
#touch /root/{{ key }} & touch /root/{{ value[0].path }}:
mkdir -p /webs/{{ value[0].path }} && echo "<?php\necho '<pre>';\nvar_dump('{{ key }}');\n" > /webs/{{ value[0].path }}/index.php:
    cmd:
        - run
        - user: root
        - group: root
        - mode: 644 
{% endfor %}
