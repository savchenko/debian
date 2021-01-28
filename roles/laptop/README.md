# Laptop

Configures Debian installation to be used on a laptop. 

## Notes

### Tor

`torbrowser-launcher` does not work on Wayland as Firefox in this package is compiled without the `MOZ_ENABLE_WAYLAND`.
`torsocks` can be used to route an arbitrary application via Tor.

## Requirements

Ansible ≥2.9  
Debian 11 (might work on its derivatives, however this is not guaranteed)

## Role Variables

| Variable                   | Description                                                | Default                  |
|----------------------------|------------------------------------------------------------|--------------------------|
| alsa_out_card              | Default ALSA output card                                   | 0                        |
| alsa_out_device            | Default ALSA output device                                 | 0                        |
| alsa_setup                 | Setup ALSA?                                                | false                    |
| enable_sleep_hibernate     | Enable S3/S4 modes?                                        | true                     |
| intel_disable_igfx         | Disable iGFX on Intel platform.                            | false                    |
| intel_hda_options          | List of string that are applied via modprobe.              | []                       |
| logind_hibernate_delay     | Seconds to wait before transitioning from S3 to hibernate. | 900                      |
| logind_idle_action         | What to do when machine is idle.                           | "suspend-then-hibernate" |
| logind_idle_time           | Idle time in seconds.                                      | 600                      |
| logind_lid_action          | What to do when lid is closed.                             | "suspend-then-hibernate" |
| logind_powerbutton_action  | Action to execute when power button is pressed.            | "poweroff"               |
| systemd_units_disable      | List of systemd units to disable                           | []                       |
| systemd_units_enable       | List of systemd units to enable                            | []                       |
| user_add_i2c               | Add login user to i2c group.                               | false                    |
| virtio_network_autostart   | Autostart default virtio network on boot.                  | true                     |
| virtio_use_default_network | Use NAT-based, "default" virtio setup.                     | true                     |


## Dependencies
Should be installed on a computer that is already provisioned with the [base](https://github.com/savchenko/debian/roles/base/README.md) role.

## License
MIT

## Author Information
Andrew Savchenko  
https://savchenko.net
