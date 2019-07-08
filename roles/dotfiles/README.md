Dotfiles
=========
Setup dotfiles from the repository.

Requirements
------------
Ansible >=2.4  
Corresponding application (see below).

Role Variables
--------------
`link_to_localhost` - defines if Ansible should link dotfiles to the _local_ $HOME.  
`neovim` - all-inclusive, 5-stars neovim setup.
`remote_bash_emacs` - Boolean, if true, will switch bash to "regular" Emacs-like mode.

Dependencies
------------
None.

Example Playbook
----------------
```yaml
---
- hosts: server, another_server
  tasks:
  - name: Execute `dotfiles` role
    include_role:
      name: dotfiles
    vars:
      neovim: true
      link_to_localhost: false
```

License
-------
MIT

Author Information
------------------
Andrew Savchenko  
https://savchenko.net
