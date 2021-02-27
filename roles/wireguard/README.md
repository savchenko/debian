Role Name
=========
Configures Wireguard on the target machine and provisions arbitrary number of clients.

Requirements
------------
Ansible ≥2.9  
Debian 11 (might work on its derivatives, however this is not guaranteed)

Role Variables
--------------

| Variable   | Description                     | Default |
|------------|---------------------------------|---------|
| wg_iface   | Interface name                  | wg0     |
| wg_systemd | Enable systemd unit on startup? | True    |
| wg_clients | List of client's pubkeys/IPs    | -       |

### wg_clients
Format is as following:

```yaml
wg_clients:
  - { name: 'MyClient', pubkey: '...xxxxxxx=', psk: '...xxxxxxx=', ip: '1.1.1.1' }
```

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
