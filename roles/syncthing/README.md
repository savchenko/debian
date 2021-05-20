# Syncthing
Configures [Syncthing](https://github.com/etesync/server) on the target host.


## Requirements

- Ansible ≥2.10
- Python ≥3.9
- Debian 11 (might work on its derivatives, however this is not guaranteed)


## Role Variables

| Variable                  | Description                           | Default               |
|---------------------------|---------------------------------------|-----------------------|
| sctg_client               | Hash of client's parameters.          | {}                    |
| sctg_client_default_dir   | Default folder path                   | '/dev/null'           |
| sctg_client_default_pause | Pause default share?                  | True                  |
| sctg_client_default_type  | `sendreceive/sendonly/receiveonly`    | 'sendreceive'         |
| sctg_client_disco_addr    | Address of the discovery server.      | ''                    |
| sctg_client_disco_global  | Enable global unicast announcements?  | True                  |
| sctg_client_disco_id      | Fingerprint of the discovery server.  | ''                    |
| sctg_client_disco_local   | Enable local broadcast announcements? | False                 |
| sctg_client_gui           | Enable GUI?                           | False                 |
| sctg_client_home          | Where to store config and DB.         | '~/.config/syncthing' |
| sctg_client_nat_enable    | Enable NAT-PMP / UPnP?                | False                 |
| sctg_client_relay_enable  | Connect via relay(s)?                 | True                  |
| sctg_client_scratch       | Wipe existing client config?          | False                 |
| sctg_client_untrusted     | Mark device as untrusted?             | False                 |
| sctg_disco                | Hash of discovery server parameters.  | {}                    |
| sctg_install_client       | Install client?                       | False                 |
| sctg_install_disco        | Install discovery server?             | False                 |
| sctg_install_relay        | Install relay server?                 | False                 |
| sctg_relay                | Hash of relay server parameters.      | {}                    |
| sctg_wipe                 | Re-write existing setup?              | False                 |


### Notes

- Role executes against user that is used to connect to the target host (`ansible_env.USER`). Ensure that user can `sudo` and provide password with `--ask-become-pass` if necessary.

- `sctg_client_default_type` will be locked to "receive-encrypted" if `sctg_client_untrusted` is set to `True`.

- `sctg_client_disco_id` and `sctg_client_disco_addr` must be defined as pair. If _both_ are undefined, then Syncthing will use the default ones.

- Automatic upgrades and telemetry are disabled.

- Firewall setup is not covered in this role.


### Parameter structs


#### Syncthing client

```yaml
- sctg_client: {
                'shasum': '03ba1fb7326d089...'
                'id': 'AAAAAAA-BBBBBBB-...' # populated during run
               }
```

#### Relay server

```yaml
- sctg_relay: {
                'shasum': '715525cb0e83513...'
               }
```

#### Discovery server

```yaml
- sctg_relay: {
                'shasum': '03ba1fb7326d089...'
               }
```


## Dependencies
Tested on a remote that is already provisioned with the [base role](https://github.com/savchenko/debian/blob/bullseye/roles/base/README.md).


## License
Apache 2.0


## Author Information
Andrew Savchenko

https://savchenko.net
