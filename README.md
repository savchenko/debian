# Playbook
Backbone for the "Sensible computing platform". Performs initial setup and maintenance of a \*nix-based computer.  
Install via `ansible-galaxy install stoptracking.playbook` or by cloning this repository.

## Currently available roles

### Hosts
Creates `/etc/hosts.blocked` list to supress advertisement and tracking.
Can include arbitrary websites you don't like.  
After the file is updated, attempts to restart service defined in `resolver` variable, by default `dnsmasq`.
