# ssh
To manage openssh package, service and configuration from salt for Linux servers. (RedHat & Suse)

## Details
This salt formula will install ssh package, start sshd service and change the configuration for rpm based Linux servers.  The main purpose of this formula is to change/controll the sshd parameters based on pillar values. The default ssh settings can be delecared in pillar/default.sls. The default settings can be override by keeping the values in pillar/ssh/<Minion_id>.sls. This gives flexiability to change the ssh parametes easily. It uses augeas configuration file management tool to change the parameters. So this module will install python-augeas package additionally.

* Sample pillar values
#### /srv/pillar/default.sls
```
ssh:
  PermitRootLogin: 'no'
  PasswordAuthentication: 'yes'
  PubkeyAuthentication: 'yes'
  Banner: '/etc/issue'
```
#### /srv/pillar/ssh/web.sls

```
ssh:
  PermitRootLogin: 'yes'
  PasswordAuthentication: 'yes'
```
For A0DF minion, the PermitRootLogin will taken from A0DF.sls file (that is 'yes') not from default.sls

#### /srv/pillar/ssh/init.sls

```
##Look for minion_id sls file. Don't give error message if file for minion is missing.

{% include 'ssh/' + grains['id'][0:3] + '.sls' ignore missing %}
```

## Comptible
This salt formula is tested on RHEL and SUSE servers. 
