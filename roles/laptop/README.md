Laptop
=========
Configures Debian installation to be used on a laptop. 

Requirements
------------
Should be installed on a computer that is already provisioned with the [base](https://github.com/savchenko/debian/roles/base/README.md) role.

Role Variables
--------------

| Variable           | Description                     | Default |
|--------------------|---------------------------------|---------|
| disable_igfx       | Disable iGFX on Intel platform. | False   |
| alsa_out_primary   | Primary ALSA output device      | 3       |
| alsa_out_secondary | Secondary ALSA output device    | 1       |
| alsa_in            | Default ALSA input              | -       |

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
