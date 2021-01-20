Laptop
=========
Configures Debian installation to be used on a laptop. 

### Notes
1. Modern ALSA does mixing just fine by default. Don't add PulseAudio layer unless necessary.
2. `torbrowser-launcher` does not work on Wayland as Firefox in this package is compiled without the `MOZ_ENABLE_WAYLAND`.
3. 

Requirements
------------
Should be installed on a computer that is already provisioned with the [base](https://github.com/savchenko/debian/roles/base/README.md) role.

Role Variables
--------------

| Variable                   | Description                              | Default |
|----------------------------|------------------------------------------|---------|
| alsa_in                    | Default ALSA input                       | 1       |
| alsa_out_primary           | Primary ALSA output device               | 1       |
| alsa_out_secondary         | Secondary ALSA output device             | 2       |
| intel_disable_igfx         | Disable iGFX on Intel platform.          | false   |
| systemd_units_disable      | List of systemd units to disable         | -       |
| systemd_units_enable       | List of systemd units to enable          | -       |
| virtio_network_autostart   | Autostart default virtio network on boot | true    |
| virtio_use_default_network | Use NAT-based, "default" virtio setup    | true    |


Dependencies
------------
None.

License
-------
MIT

Author Information
------------------
Andrew Savchenko  
https://savchenko.net
