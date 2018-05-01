##ssh service is only for Linux servers.  Tested only of RHEL & SUSE servers. Please update map.jinja for ubuntu and other OSes.
##

{% if salt.grains.get('kernel') == 'Linux' %}
include:
  - .pkgs
  - .config
  - .start
{% endif %}
