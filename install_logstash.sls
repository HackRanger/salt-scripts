install_dependencies:
   pkg.installed:
     - pkgs:
        - openjdk-8-jre-headless
        - apt-transport-https
     - refresh: True

logstash_repo:
    pkgrepo.managed:
       - name: deb http://packages.elastic.co/logstash/5.x/debian stable main
       - key_url: https://packages.elastic.co/GPG-KEY-elasticsearch

install_logstash:
   pkg.installed:
       - name: logstash
       - refresh: True
       - require:
          - pkgrepo: logstash_repo
          - pkg: install_dependencies
   service.running:
       - name: logstash
