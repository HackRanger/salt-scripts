base:
#  'test-virtual-machine':
 #    - logstash
  #   - elasticsearch
   #  - kibana_install
  '*':
     - logstash_windows
     - filebeats
