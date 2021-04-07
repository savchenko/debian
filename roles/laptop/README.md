# Laptop

Configures Debian installation to be used on a laptop. 

## Notes

The playbook distinguishes between AMD/Intel systems, but does assume the following:
- User has non-free repository enabled and OK with installing binary firmware blobs.
- Laptop has some sort of Realtek audio codec.
- WiFi is provided by Intel chip irrespective of CPU vendor.

### S3/S4

Hibernation is disabled in kernel when system is booted in "lockdown" mode. This is the case when SecureBoot is enabled.

There is a patchset that might allow functional and secure hibernation in future: https://lore.kernel.org/lkml/20210220013255.1083202-1-matthewgarrett@google.com/T/#u

### i2c

To control external screens via DDC/CI, `ddcutil` is using i2c bus. You need to either add user to i2c group or `sudo` the call.

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
| intel_hda_options          | List of string that are applied via modprobe.              | []                       |
| logind_hibernate_delay     | Seconds to wait before transitioning from S3 to hibernate. | 900                      |
| logind_idle_action         | What to do when machine is idle.                           | "suspend-then-hibernate" |
| logind_idle_time           | Idle time in seconds.                                      | 600                      |
| logind_lid_action          | What to do when lid is closed.                             | "suspend-then-hibernate" |
| logind_powerbutton_action  | Action to execute when power button is pressed.            | "poweroff"               |
| systemd_units_disable      | List of systemd units to disable                           | []                       |
| systemd_units_enable       | List of systemd units to enable                            | []                       |
| user_add_i2c               | Add login user to i2c group.                               | false                    |

## Dependencies
It is *strongly* advised to install on a computer that is already provisioned with the [base](https://github.com/savchenko/debian/roles/base/README.md) role.amd64-microcode

## License
MIT

## Author Information
Andrew Savchenko  
https://savchenko.net
