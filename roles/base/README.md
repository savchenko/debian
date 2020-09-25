Base
=========
Setup some basic packages and settings that will be needed irrespective of target host role.

Requirements
------------
Ansible >=2.7  
Debian 10 (might work on its derivatives, however this is not guaranteed)

Role Variables
--------------
`timezone` self-explanatory. Default is "UTC"  
`locale` for example, "en_GB.UTF-8"  
`sshguard_path` path to sshguard config. Default is `/etc/sshguard/sshguard.conf`  
`sshd_less_secure` enables aes256-cbc cipher and hmac-sha-256 MAC. Might be useful for outdated clients.  
`generate_moduli` generate new set of 4096 moduli on the target host or copy pre-calculated ones. Either is better than the default set.

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
      sshd_less_secure: True
      generate_moduli: false
```

License
-------
MIT

Author Information
------------------
Andrew Savchenko  
https://savchenko.net
