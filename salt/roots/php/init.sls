{% from "php/map.jinja" import php with context %}
{% import_yaml "nginx/lib.sls" as sites %}

php:
  pkg:
    - installed
    - name: {{ php.fpm_pkg }}

{% for site in sites.sites %}
mkdir -p /webs/{{ site.dir }} && echo "<?php\necho '<pre>';\nvar_dump('$_SERVER');\n" > /webs/{{ site.dir }}/index.php:
    cmd.run
{% endfor %}
