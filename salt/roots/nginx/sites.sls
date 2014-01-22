{% import_yaml "nginx/lib.sls" as sites %}

{% for site in sites.sites %}
{{ site }}:
    file:
        - managed
        - name: /etc/nginx/sites-available/{{ site }}
        - source: salt://nginx/virtual-host
        - user: root
        - group: root
        - mode: 644
        - template: jinja
        - context:
            name: {{ site }}

ln -s /etc/nginx/sites-available/{{ site }} /etc/nginx/sites-enabled/{{ site }} && mkdir -p /webs/{{ site }} && echo "<h1>{{ site }}</h1>" > /webs/{{ site }}/index.html:
    cmd.run:
        - require:
            - file: {{ site }}
        - unless: test -f /etc/nginx/sites-enabled/{{ site }}

# mkdir -p /webs/{{ site }} && echo "<h1>{{ site }}</h1>" > /webs/{{ site }}
{% endfor %}

service nginx reload:
    cmd.run:
#        - onlyif: service nginx configtest
        - order: last
