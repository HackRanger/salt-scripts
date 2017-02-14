first:
  cmd.run:
    - name: 'c:\nssm install logstash C:\logstash\logstash-5.1.2\bin\logstash.bat'
second:
  cmd.run:
    - name: 'c:\nssm set logstash AppParameters -f C:\logstash\logstash-5.1.2\config\config.d\logstashcf.conf'
third:
  cmd.run:
    - name: 'c:\nssm set logstash AppDirectory C:\logstash\logstash-5.1.2'
four:
  cmd.run:
    - name: 'c:\nssm set logstash AppEnvironmentExtra "Java_HOME=C:\Program Files\Java\jre1.8.0_121"'
five:
  cmd.run:
    - name: 'c:\nssm set logstash AppStdout C:\logstash\stdout.log'
six:
  cmd.run:
    - name: 'c:\nssm set logstash AppStderr C:\logstash\stderr.log'
seven:
  cmd.run:
    - name: 'c:\nssm set logstash AppStopMethodSkip 6'
eight:
  cmd.run:
    - name: 'c:\nssm set logstash AppStdoutCreationDisposition 2'
nine:
  cmd.run:
    - name: 'net start logstash'
