# Wireguard role

Configures Wireguard on the target machine and provisions arbitrary number of clients.

## Requirements

Ansible ≥2.9
Debian 11 (might work on its derivatives, however this is not guaranteed)

## Role Variables


| Variable         | Description                        | Default |
|------------------|------------------------------------|---------|
| wg_clients       | List of client's data              | {}      |
| wg_forward       | Forward between clients?           | False   |
| wg_iface         | Interface name                     | wg0     |
| wg_keepalive     | Interval to send keepalive packets | -       |
| wg_overwrite     | Overwrite existing config?         | False   |
| wg_port          | Server port                        | 51820   |
| wg_server_ip     | Server IP address                  | -       |
| wg_server_subnet | Server's subnet                    | -       |
| wg_systemd       | Enable systemd unit on startup?    | True    |

### wg_clients
Format is as following, `keepalive` is disabled if set to zero.
```yaml
wg_clients:
  - { name: 'MyClient', pubkey: '...xxxxxxx=', psk: '...xxxxxxx=', ip: '1.1.1.1', keepalive: '25' }
```

### wg_server_subnet
Should be in CIDR notation, e.g. `192.168.1.0/24`.

## Example playbook
```yaml
---
- hosts: myhost
  tasks:

  - name: Execute `wireguard` role
    include_role:
      name: wireguard
      apply:
        tags:
          - role_wireguard
    tags:
      - always
    vars:
      wg_clients: 
        - { name: 'ClientA', pubkey: 'WC5a0cSWATZwLsQH1REjGcQsomZyEtRTaAqyRK20emY=', psk: 'yKsg+u7zY9N5rjgR3YE6cSu90aFBpxEPA3uKzK9vJc0=', ip: '192.168.75.20', keepalive: '58' }
        - { name: 'ClientB', pubkey: 'qOwMjZuaVjfmdCSoOQbTp8MPADN+yB5gjRAmddA7jUM=', psk: 'Fo1UMMLxbyPiYwrJ/vE7tqPa66gblskjIc5xyQPsXgg=', ip: '192.168.75.30', keepalive: '0' }
      wg_forward: true
      wg_iface: wg0
      wg_systemd: true
      wg_port: 12345
      wg_server_ip: 192.168.75.1
      wg_server_subnet: '192.168.75.0/24'
      wg_overwrite: false
```

## Dependencies
Tested on machine that is already provisioned with the [base role](https://github.com/savchenko/debian/blob/bullseye/roles/base/README.md). Likely to complain about missing packages if executed against untouched minimal installation.

## License
MIT

## Author Information
Andrew Savchenko  
https://savchenko.net
