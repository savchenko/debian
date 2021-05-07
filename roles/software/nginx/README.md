# EteSync
Configures [nginx](https://tracker.debian.org/pkg/nginx) on the target host.


## Requirements

- Ansible ≥2.9
- Python ≥3.7
- Debian 11 (might work on its derivatives, however this is not guaranteed)


## Role Variables

| Variable    | Description                | Default |
|-------------|----------------------------|---------|
| ngx_flavour | `full` or `light` package? | light   |

### Remarks



## Dependencies
Tested on a remote that is already provisioned with the [base role](https://github.com/savchenko/debian/roles/base/README.md).  


## License
Apache 2.0


## Author Information
Andrew Savchenko  
https://savchenko.net
