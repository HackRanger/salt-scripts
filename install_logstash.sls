install_dependencies1:
   pkg.installed:
     - pkgs:
        - openjdk-8-jre-headless
        - apt-transport-https
     - refresh: True

logstash_repo:
    pkgrepo.managed:
       - name: deb http://packages.elastic.co/elasticsearch/5.x/debian stable main
       - key_url: https://packages.elastic.co/GPG-KEY-elasticsearch

install_logstash:
   pkg.installed:
       - name: logstash
       - refresh: True
       - require:
          - pkgrepo: logstash_repo
          - pkg: install_dependencies1
   service.running:
       - name: logstash

edit_conf:
   file.blockreplace:
      - name: /etc/logstash/logstash.yml
      - marker_start: "# Set the bind address to a specific IP (IPv4 or IPv6):"
      - marker_end: '# network.host: "localhost"'
      - content: 'network.host: 0.0.0.0'
