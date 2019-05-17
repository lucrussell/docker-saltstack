zabbix-agent:
  pkg.installed:
    - sources:
      - zabbix-agent: salt://pkgs/zabbix-agent-4.0.7-1.el7.x86_64.rpm

/etc/zabbix/zabbix_agentd.conf:
  file.managed:
    - source: salt://zabbix-agent/zabbix_agentd.conf
    - template: jinja
    - require:
      - pkg: zabbix-agent
