Hosts
=========
Creates "hosts.blocked" list to supress advertisement and tracking.
Can include arbitrary websites you don't like.

Requirements
------------
Ansible >=2.4  
Python 2.X to run `./files/make_hosts.py`

Role Variables
--------------
`resolver` DNS resolver

Dependencies
------------
None

Example Playbook
----------------
```yaml
---
- hosts: laptop, server
  tasks:
  - name: Execute `hosts` role
    include_role:
      name: hosts
    vars:
      resolver: dnsmasq
```

License
-------
MIT

Author Information
------------------
Andrew Savchenko  
https://savchenko.net
