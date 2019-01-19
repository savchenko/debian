Role Name
=========
Creates "hosts.blocked" list to supress advertisement and tracking.
Can include arbitrary websites you don't like.

Requirements
------------
By default restarts `kresd` (knot-resolver), can be easility adapted for DNS server of your choice.

Role Variables
--------------
resolver: DNS resolver

Dependencies
------------
Uses python to run `./files/make_hosts.py`

Example Playbook
----------------
```
    - hosts: localnet
      roles:
         - { role: username.rolename, resolver: kresd }
```

License
-------
MIT

Author Information
------------------
Andrew Savchenko
https://savchenko.net
