# EteSync
Configures [EteSync](https://github.com/etesync/server) server on the target host.

## Requirements

- Ansible ≥2.9
- Python ≥3.7
- Debian 11 (might work on its derivatives, however this is not guaranteed)


## Role Variables
| Variable    | Description                                    | Default       |
|-------------|------------------------------------------------|---------------|
| esc_path    | Installation path                              | ""            |
| esc_hosts   | List of domains/IPs on which server is served. | 127.0.0.1     |
| esc_debug   | Deloy in debug mode?                           | False         |
| esc_rootdir | Path to the user data                          | ""            |
| esc_skey    | Django's `SECRET_KEY`                          | Random string |


## Dependencies
Tested on machine that is already provisioned with the [base role](https://github.com/savchenko/debian/blob/bullseye/roles/base/README.md).  
Likely to complain about missing packages if executed against untouched minimal installation.


## License
Apache 2.0


## Author Information
Andrew Savchenko  
https://savchenko.net
