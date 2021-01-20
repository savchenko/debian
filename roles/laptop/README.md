# Laptop

Configures Debian installation to be used on a laptop. 

## Notes

### ALSA

Modern ALSA does mixing just fine by default. Do not add PulseAudio layer unless necessary.

To determine what device corresponds to each card:
1. Connect all devices you plan to use
2. Use `aplay -l` and `arecord -l` to find the input and output card numbers.
3. Set variables in your playbook accordingly.

General logic:
1. If "primary" device is available - use it.
2. Otherwise, safely fall-back to the "secondary" one.

### Tor

`torbrowser-launcher` does not work on Wayland as Firefox in this package is compiled without the `MOZ_ENABLE_WAYLAND`.

`torsocks` can be used to route an arbitrary application via Tor.

## Requirements

Ansible ≥2.9  
Debian 11 (might work on its derivatives, however this is not guaranteed)

## Role Variables

| Variable                   | Description                              | Default |
|----------------------------|------------------------------------------|---------|
| alsa_in                    | ALSA input                               | 1       |
| alsa_out_primary           | Primary ALSA output device               | 1       |
| alsa_out_secondary         | Secondary ALSA output device             | 2       |
| intel_disable_igfx         | Disable iGFX on Intel platform.          | false   |
| systemd_units_disable      | List of systemd units to disable         | -       |
| systemd_units_enable       | List of systemd units to enable          | -       |
| user_add_i2c               | Add login user to i2c group              | false   |
| virtio_network_autostart   | Autostart default virtio network on boot | true    |
| virtio_use_default_network | Use NAT-based, "default" virtio setup    | true    |


## Dependencies

Should be installed on a computer that is already provisioned with the [base](https://github.com/savchenko/debian/roles/base/README.md) role.

## License
MIT

## Author Information
Andrew Savchenko  
https://savchenko.net
