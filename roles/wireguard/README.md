Role Name
=========
Configures Wireguard on the target machine and provisions arbitrary number of clients.

Requirements
------------
Ansible ≥2.9  
Debian 11 (might work on its derivatives, however this is not guaranteed)

Role Variables
--------------

| Variable         | Description                        | Default |
|------------------|------------------------------------|---------|
| wg_clients       | List of client's pubkeys/IPs       | {}      |
| wg_forward       | Forward between clients?           | False   |
| wg_iface         | Interface name                     | wg0     |
| wg_systemd       | Enable systemd unit on startup?    | True    |
| wg_port          | Server port                        | 51820   |
| wg_server_ip     | Server IP address                  | -       |
| wg_server_subnet | Server's subnet                    | -       |
| wg_keepalive     | Interval to send keepalive packets | -       |

### wg_clients
Format is as following:

```yaml
wg_clients:
  - { name: 'MyClient', pubkey: '...xxxxxxx=', psk: '...xxxxxxx=', ip: '1.1.1.1' }
```

### wg_server_subnet
Should be in CIDR notation, e.g. `192.168.1.0/24`.

Dependencies
------------
Tested on machine that is already provisioned with the [base role](https://github.com/savchenko/debian/blob/bullseye/roles/base/README.md). Likely to complain about missing packages if executed against untouched minimal installation.

License
-------
MIT

Author Information
------------------
Andrew Savchenko  
https://savchenko.net
