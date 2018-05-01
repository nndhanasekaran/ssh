# ssh
To manage openssh package, service and configuration from salt for Linux servers. (RedHat & Suse)

# Details
This salt formula will install ssh package, start sshd service and change the configuration for rpm based Linux servers.  The main purpose of this formula is to change/controll the sshd parameters based on pillar values. The default ssh settings can be delecared in pillar/default.sls. The default settings can be override by keeping the values in pillar/ssh/<Minion_id>.sls. This gives flexiability to change the ssh parametes easily. It uses augeas configuration file management tool to change the parameters. So this module will install python-augeas package additionally.

Examples: (Pillar)

/srv/pillar/default.sls
--------------------------------
ssh:
  PermitRootLogin: 'no'
  PasswordAuthentication: 'yes'
  PubkeyAuthentication: 'yes'
  Banner: '/etc/issue'
--------------------------------

/srv/pillar/ssh/A0DF.sls
--------------------------------
ssh:
  PermitRootLogin: 'yes'
  PasswordAuthentication: 'yes'
--------------------------------

For A0DF minion, the PermitRootLogin will taken from A0DF.sls file (that is 'yes') not from default.sls

/srv/pillar/ssh/init.sls
##Look for RID.sls file and give the mentioned values. Don't give error message if RID.sls is missing.

{% include 'ssh/' + grains['id'][0:4] + '.sls' ignore missing %}

