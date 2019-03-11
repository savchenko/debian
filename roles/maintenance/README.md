Maintenance
=========
Common maintenance tasks

Requirements
------------
Ansible >=2.4  

Role Variables
--------------
None

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
      name: maintenance
```

License
-------
MIT

Author Information
------------------
Andrew Savchenko  
https://savchenko.net
