Base
=========
Setup some basic packages and settings that will be needed irrespective of target host role.

Requirements
------------
Ansible >=2.4  
Debian 9 (might work on its derivatives, however this is not guaranteed)

Role Variables
--------------
`timezone` self-explanatory. Default is "UTC"  
`locale` for example, "en_GB.UTF-8"  
`sshguard_path` path to sshguard config. Default is `/etc/sshguard/sshguard.conf`

Dependencies
------------
None

Example Playbook
----------------
```yaml
---
- hosts: laptop, server
  tasks:
  - name: Execute `base` role
    include_role:
      name: base
    vars:
      timezone: Australia/Adelaide
      locale: en_US.UTF-8
      sshguard_path: /etc/sshguard/sshguard.conf
```

License
-------
MIT

Author Information
------------------
Andrew Savchenko  
https://savchenko.net
