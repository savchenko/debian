# EteSync
Configures [EteSync server](https://github.com/etesync/server) on the target host.

## Requirements

- Ansible ≥2.9
- Python ≥3.7
- Debian 11 (might work on its derivatives, however this is not guaranteed)


## Role Variables

| Variable    | Description                                    | Default       |
|-------------|------------------------------------------------|---------------|
| esc_debug   | Deloy in debug mode?                           | False         |
| esc_hosts   | List of domains/IPs on which server is served. | ['127.0.0.1'] |
| esc_path    | Installation path                              | ''            |
| esc_port    | Port of which to serve EteSync HTTPs           | 8000          |
| esc_rootdir | Path to the user data                          | ''            |
| esc_skey    | Django's `SECRET_KEY`                          | Random string |
| esc_user    | User used to run the server                    | 'www-uvicorn' |
| esc_version | SHA1 hash of the commit to checkout.           | ''            |


## Dependencies
Tested on machine that is already provisioned with the [base role](https://github.com/savchenko/debian/blob/bullseye/roles/base/README.md).  
Likely to complain about missing packages if executed against untouched minimal installation.


## License
Apache 2.0


## Author Information
Andrew Savchenko  
https://savchenko.net
