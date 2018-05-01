##ssh service is only for Linux servers. 

{% if salt.grains.get('kernel') == 'Linux' %}
include:
  - .pkgs
  - .config
  - .start
{% endif %}
