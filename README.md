# Playbook
Backbone for the "Sensible computing platform". Performs initial setup and maintenance of a \*nix-based computer. Install by cloning this repository and building upon one of the `example_playbook_*` YAML files.

## Howto

Suggested execution order, all roles after "Base" are optional:

1. Base
1. Laptop
1. Software
1. Transfer agent
1. Wireguard
1. nginx
1. EteSync
1. Hosts

### Example usage

```sh
$ cp example_playbook_local.yml playbook_local
$ # ...adjust to taste...
$ ansible-playbook playbook_local.yml --ask-become-pass --tags "tag1,tag2"
```

## Currently available roles

### Base
Basic preparation of the target host: updating some of the system's settings, installation of the packages and so on. Unequivocally, this is opinionated role, please review its [Readme](https://github.com/savchenko/debian/roles/base/README.md) to ensure it is in line with your preferences.

### Laptop
Unsurprisingly, configures a laptop. [Readme](https://github.com/savchenko/debian/roles/laptop/README.md). 

### Software
Installation and configuration of various userland packages. [Readme](https://github.com/savchenko/debian/roles/software/README.md).

### Dotfiles
Distributes dotfiles to the target host. Supports either copying files to the remote host or symlinking from the role's [./files/](https://github.com/savchenko/debian/roles/dotfiles/files) to the destination directories within `$HOME`. Has its own [Readme](https://github.com/savchenko/debian/roles/dotfiles/README.md).

### Transfer agent
Creates jailed user that has access only to `sh` and `rsync`. Supports automatic propagation of SSH keys to the remote host. Traditionally, has [Readme](https://github.com/savchenko/debian/roles/transfer_agent).

### Wireguard
All-inclusive, safe role to provision Wireguard in any mode imaginable. [Readme](https://github.com/savchenko/debian/roles/wireguard/README.md). 

### nginx
Laconic, but fully-sufficient provisions an arbitrary number of domains on a remote `nginx` instance. [Readme](https://github.com/savchenko/debian/roles/nginx/README.md)

### EteSync
Set-up EteBase server: uvicorn and nginx, includes automatic HTTPs via `certbot`. [Readme](https://github.com/savchenko/debian/blob/role_etesync/roles/etesync/README.md).

### Hosts  
_**(Pending update to support Knot-Resolver)**_  

Creates `/etc/hosts.blocked` list to suppress advertisement and tracking.
Can include arbitrary websites you don't like. After the file is updated, attempts to restart service defined in `resolver` variable, by default `dnsmasq`.
