##Get the paramters from pillar. The default parameters are in default.sls pillar file and 
##we can override by creating file inside pillar/ssh/minionid.sls file. 
##We can change any parameter eventhough it is not listed in default parameters. 
##The minionid.sls file is preccedence above default.
{% for param, value in pillar.get('ssh', {}).items() %}

{{ param }}:
  augeas.change:
    - lens: sshd.lns
    - context: /files/etc/ssh/sshd_config
    - changes:
      - set {{ param }} {{ value }}

{% endfor %}

