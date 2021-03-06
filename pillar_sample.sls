ssh:
  Protocol: '2'
  MaxAuthTries: '4'
  IgnoreRhosts: 'yes'
  X11Forwarding: 'no'
  LoginGraceTime: '60'
  Banner: '/etc/issue'
  PermitRootLogin: 'no'
  AllowTcpForwarding: 'no'
  ClientAliveCountMax: '0'
  ClientAliveInterval: '300'
  PermitEmptyPasswords: 'no'
  PubkeyAuthentication: 'yes'
  PermitUserEnvironment: 'no'
  PasswordAuthentication: 'yes'
  HostbasedAuthentication: 'no'
