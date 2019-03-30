Dotfiles
=========
Setup dotfiles from the repository.

Requirements
------------
Ansible >=2.4  
Corresponding application (see below).

Role Variables
--------------
Variables below define if dotfiles for the corresponding application should be installed.  
If variable is declared - respective settings will be copied to the target host.  
`tmux`
`weechat`
`neovim`
`neomutt`


Dependencies
------------
None.

Example Playbook
----------------
```yaml
---
- hosts: laptop, server
  tasks:
  - name: Execute `dotfiles` role
    include_role:
      name: dotfiles
    vars:
      tmux: true
      weechat: true
      neovim: true
      neomutt: true
```

License
-------
MIT

Author Information
------------------
Andrew Savchenko  
https://savchenko.net
