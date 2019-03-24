Transfer-agent
=========
Setup jailed user, useful for rsync/sftp. Chroot example:  
```
.
|-- bin
|   `-- sh
|-- data
|-- lib
|   `-- x86_64-linux-gnu
|       |-- libacl.so.1
|       |-- libattr.so.1
|       |-- libc.so.6
|       `-- libpopt.so.0
|-- lib64
|   `-- ld-linux-x86-64.so.2
`-- usr
    `-- bin
        `-- rsync
```

Requirements
------------
Ansible >=2.4  
Debian 9 (might work on its derivatives, however this is not guaranteed)  
Presence of the following block in your `/etc/ssh/sshd_config`:
```sh
Match Group agents
    PasswordAuthentication no
    ChrootDirectory %h
    AllowTcpForwarding no
    AllowAgentForwarding no
    PermitTunnel no
    X11Forwarding no
```
If you decide to change name of the group (e.g. "minions" instead of "agents"), please adjust SSHd config accordingly.

Role Variables
--------------
`agent_name` Username to create  
`agent_group` Users that belong to this group will be chroot'ed to their home directories.  
`rsync` If set to false, rsync binaries won't be added.  
`pubkey_from_current_user` If set to true, will add `~/.ssh/id_rsa.pub` to the `~/.ssh/authorized_keys`.  
`pubkey_from_others` If set to true, will add all *.pub files from `../files/` to the `~/.ssh/authorized_keys`.

Dependencies
------------
rsync.

Example Playbook
----------------
```yaml
---
- hosts: laptop, server
  tasks:
  - name: Execute `transfer-agent` role
    include_role:
      name: transfer-agent
    vars:
      agent_group: "agents"
      agent_name: "xfer"
      rsync: true
      pubkey_from_current_user: true
      pubkey_from_others: true
```

License
-------
MIT

Author Information
------------------
Andrew Savchenko  
https://savchenko.net
