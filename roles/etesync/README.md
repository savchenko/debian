# EteSync
Configures [EteSync server](https://github.com/etesync/server) on the target host.

## Requirements

- Ansible ≥2.9
- Python ≥3.7
- Debian 11 (might work on its derivatives, however this is not guaranteed)


## Role Variables

| Variable        | Description                               | Default                                    |
|-----------------|-------------------------------------------|--------------------------------------------|
| esc_admin       | Name of the EteSync administrator user.   | random word                                |
| esc_admin_email | E-mail of the administrator user.         | ''                                         |
| esc_cert_email  | E-mail to use for LetsEncrypt deployment. | ''                                         |
| esc_debug       | Deloy in debug mode?                      | False                                      |
| esc_do_https    | Provision HTTPs?                          | True                                       |
| esc_hosts       | List of domains/IPs to listen on.         | ['127.0.0.1']                              |
| esc_path        | Installation path                         | '/var/www/esc_server'                      |
| esc_port        | Port of which to serve EteSync initially. | 80                                         |
| esc_repository  | GIT repository to clone from.             | 'https://github.com/etesync/server'        |
| esc_rm_existing | Replace existing EteSync installation?    | False                                      |
| esc_rootdir     | Path to the user data                     | '/var/www/html/esc_server'                 |
| esc_user        | User used to run the server               | 'www-uvicorn'                              |
| esc_version     | SHA1 hash of the commit to checkout.      | '43d5af32d72d5f59de7f31698076becf2430ccaa' |

### Remarks

- It is recommended you do not define `esc_admin` and allow playbook to choose a random word for it.
- If you _do_ define `esc_admin`, ensure it is at least 3 characters long.
- Role will not create another superuser if there is already one in DB.
- UFW/nftables are not covered in this role, use [base role] for it, like so
  ```yaml
  ufw_rule:
  - { comment: 'Allow EteSync admin', direction: 'in', from: 'any', port: '1234', proto: 'tcp', rule: 'allow' }
  ufw_service:
  - { comment: 'Allow http', rule: 'allow', service: 'Nginx HTTP' }
  - { comment: 'Allow https', rule: 'allow', service: 'Nginx HTTPS' }
  ```
- It is strongly advised to keep `esc_port` set to 80. This will allow `certbot` to setup automatic redirect from HTTP to HTTPs.

## Dependencies
Tested on machine that is already provisioned with the [base role](https://github.com/savchenko/debian/blob/bullseye/roles/base/README.md).  
Likely to complain about missing packages if executed against untouched minimal installation.


## License
Apache 2.0


## Author Information
Andrew Savchenko  
https://savchenko.net
