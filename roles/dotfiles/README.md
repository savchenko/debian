Dotfiles
=========
Setup dotfiles from this repository. Summary:
1. Construct list of valid dotfiles
1. Hush login message, set proper `~/.ssh` and `~/.gpg` permissions.
1. Setup `bat` theme and `tmux` terminfo.
1. Backup existing dotfiles if found.
1. Either:
  1. Copy to remote host under `~/.local/etc/dotfiles` and link to respective locations.
  2. Or link from this role directly. For example, if executing against localhost.
1. Adapt dotfiles for the remote host if requested.
1. Setup nVim with plugins.

Requirements
------------
Ansible ≥2.9  
Corresponding applications installed.

Role Variables
--------------

| Variable          | Description                                                         | Default |
|-------------------|---------------------------------------------------------------------|---------|
| copy_dotfiles     | Copy dotfiles to the remote host instead of linking from this role. | false   |
| link_to_localhost | Link to the target's $HOME from this role.                          | true    |
| setup_neovim      | All-inclusive, 5-stars neovim setup.                                | false   |
| remote_bash_emacs | Switch bash to "regular" Emacs-like mode                            | false   |
 

Dependencies
------------
None.

License
-------
MIT

Author Information
------------------
Andrew Savchenko  
https://savchenko.net
