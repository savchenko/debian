# Playbook
Backbone for the "Sensible computing platform". Performs initial setup and maintenance of a \*nix-based computer.  
Install via `ansible-galaxy install stoptracking.playbook` or by cloning this repository.

## Currently available roles

### Base
Basic preparation of the target host: updating some of the system settings and packages installation.  
Unequivocally, this is opinionated role, please review `packages_install.yml` to ensure it is in line with your preferences.

### Hosts
Creates `/etc/hosts.blocked` list to suppress advertisement and tracking.
Can include arbitrary websites you don't like.  
After the file is updated, attempts to restart service defined in `resolver` variable, by default `dnsmasq`.

### Maintenance
Currently contains only `apt_upgrade` task. Stay tuned.
