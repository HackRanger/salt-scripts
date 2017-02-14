kibana_repo:
    pkgrepo.managed:
       - name: deb https://artifacts.elastic.co/packages/5.x/apt stable main

install_kibana:
   pkg.installed:
       - name: kibana
       - refresh: True
       - require:
          - pkgrepo: kibana_repo
   service.running:
       - name: kibana

kibana_conf:
   file.blockreplace:
      - name: /etc/kibana/kibana.yml
      - marker_start: "# To allow connections from remote users, set this parameter to a non-loopback address."
      - marker_end: '# server.host: "localhost"'
      - content: 'server.host: 0.0.0.0'
