install_dependencies:
   pkg.installed:
     - pkgs:
        - openjdk-8-jre-headless
        - apt-transport-https
     - refresh: True

elasticsearch_repo:
    pkgrepo.managed:
       - name: deb http://packages.elastic.co/elasticsearch/5.x/debian stable main
       - key_url: https://packages.elastic.co/GPG-KEY-elasticsearch

install_esearch:
   pkg.installed:
       - name: elasticsearch
       - refresh: True
       - require:
          - pkgrepo: elasticsearch_repo
          - pkg: install_dependencies
   service.running:
       - name: elasticsearch

edit_conf:
   file.blockreplace:
      - name: /etc/elasticsearch/elasticsearch.yml
      - marker_start: "# Set the bind address to a specific IP (IPv4 or IPv6):"
      - marker_end: '# network.host: "localhost"'
      - content: 'network.host: 0.0.0.0'
