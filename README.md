# Playbook
Backbone for the "Sensible computing platform". Performs initial setup and maintenance of a \*nix-based computer. Install by cloning this repository and building upon one of the `example_playbook_*` YAML files.

Majority of commits are currently made under the [Bullseye](https://github.com/savchenko/debian/tree/bullseye) branch; some of these _might_ be backported to [Buster](https://github.com/savchenko/debian/tree/buster) in future.

## Currently available roles

### Base
Basic preparation of the target host: updating some of the system's settings, installation of the packages and so on. Unequivocally, this is opinionated role, please review its [Readme](https://github.com/savchenko/debian/blob/bullseye/roles/base/README.md) to ensure it is in line with your preferences.

### Dotfiles
Distributes dotfiles to the target host. Supports either copying files to the remote host or symlinking from the role's [./files/](https://github.com/savchenko/debian/tree/bullseye/roles/dotfiles/files) to the destination directories within `$HOME`. Has its own [Readme](https://github.com/savchenko/debian/blob/bullseye/roles/dotfiles/README.md).

### Transfer-agent
Creates jailed user that has access only to `sh` and `rsync`. Supports automatic propagation of SSH keys to the remote host. Traditionally, has [Readme](https://github.com/savchenko/debian/tree/bullseye/roles/transfer-agent).

### Laptop
Unsurprisingly, configures a laptop. [Readme](https://github.com/savchenko/debian/blob/bullseye/roles/laptop/README.md). 

### Hosts  
_**(Pending update to support Knot-Resolver)**_  

Creates `/etc/hosts.blocked` list to suppress advertisement and tracking.
Can include arbitrary websites you don't like. After the file is updated, attempts to restart service defined in `resolver` variable, by default `dnsmasq`.
