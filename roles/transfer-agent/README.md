Transfer agent
=========
Setup jailed user, useful for a secure rsync/sftp. Chroot example:  
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
|       |-- libcrypto.so.1.1
|       |-- libdl.so.2
|       |-- liblz4.so.1
|       |-- libpopt.so.0
|       |-- libpthread.so.0
|       |-- libxxhash.so.0
|       |-- libz.so.1
|       `-- libzstd.so.1
|-- lib64
|   `-- ld-linux-x86-64.so.2
`-- usr
    `-- bin
        `-- rsync
```

Requirements
------------
Ansible ≥2.9  
Debian 11 (might work on its derivatives, however this is not guaranteed)  
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

| Variable                 | Description                                                                   | Default |
|--------------------------|-------------------------------------------------------------------------------|---------|
| agent_name               | Username to create                                                            | xfer    |
| agent_group              | Users from this group will be chroot'ed to their home directories.            | agents  |
| add_rsync                | Add `rsync` binaries                                                          | true    |
| pubkey_from_current_user | Add local `~/.ssh/id_rsa.pub` to the target's `~/.ssh/authorized_keys`.       | true    |
| pubkey_from_others       | Add all *.pub keys from `../files/` to the target's `~/.ssh/authorized_keys`. | true    |
| remove_existing_user     | Wipe existing user if found, delete all their files.                          | false   |

Dependencies
------------
rsync.


License
-------
MIT

Author Information
------------------
Andrew Savchenko  
https://savchenko.net
