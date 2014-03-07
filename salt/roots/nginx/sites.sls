{% import_yaml "nginx/lib.sls" as sites %}

{% for key, value in sites.items() %}
{{ value[0].path }}:
    file:
        - managed
        - name: /etc/nginx/sites-available/{{ value[0].path }}
        - source: salt://nginx/virtual-host
        - user: root
        - group: root
        - mode: 644
        - template: jinja
        - context:
            name: {{ value[0].path }}

ln -s /etc/nginx/sites-available/{{ value[0].path }} /etc/nginx/sites-enabled/{{ value[0].path }}:
    cmd.run:
        - require:
            - file: {{ value[0].path }}
        - unless: test -f /etc/nginx/sites-enabled/{{ value[0].path }}

{% endfor %}

service nginx reload:
    cmd.run:
#        - onlyif: service nginx configtest
        - order: last
