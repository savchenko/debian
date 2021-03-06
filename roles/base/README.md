Base
=========
Basic setup of a sensible Debian host.  
Non-exhaustive summary, majority of these are optional:  
- Setup Grub and `GRUB_CMDLINE_LINUX_DEFAULT`, enable vendor-specific IOMMU.
- Setup `dpkg` overrides, `apt` and harden permissions of various paths.
- Setup locale/timezone, hostname and packages, enable `unattended-upgrades`.
- Configure `knot-resolver` as the default DNS resolver and `timesyncd` as the NTP client.
- Configure `sshd` and open TCP/22 with limits applied via `ufw` and `sshguard` watching the login attempts.
- Generate unique set of moduli for DH key exchange.
- Configure various sysctl tunables, system and `systemd` settings.
- Disable bluetooth, thunderbolt, firewire as well as some other kernel modules.
- Configure Caps Lock key as Control modifier, setup framebuffer locale and font.
- Reduce preservation times for various logs across the system.
- If explicitely allowed, automatically reboot system at the end.

Have a look at variables section below.

Requirements
------------
Ansible ≥2.9  
Debian 11 (might work on its derivatives, however this is not guaranteed)

Role Variables
--------------

| Variable                    | Description                                                              | Default                  |
|-----------------------------|--------------------------------------------------------------------------|--------------------------|
| allow_reboot                | Automatically reboot target machine if necessary.                        | False                    |
| allow_ssh                   | Allow (and limit) incoming SSH.                                          | False                    |
| debs                        | Additional .deb packages to install.                                     | []                       |
| disable_bluetooth           | Likewise.                                                                | True                     |
| disable_firewire            | Similar to the above.                                                    | True                     |
| disable_hfs_udf             | ...                                                                      | True                     |
| disable_sleep_hibernate     | Disables respective systemd services.                                    | False                    |
| disable_speaker             | Internal "beeper" only, nothing to do with ALSA.                         | True                     |
| disable_thunderbolt         | Blacklist Thunderbolt kernel modules. [See why](https://thunderspy.io/). | True                     |
| fb_font_size                | Framebuffer font size                                                    | 10x18                    |
| fstab_noexec                | Mount /dev/shm with nodev, nosuid, and noexec.                           | True                     |
| generate_moduli             | Generate new set of 4096 DH moduli.                                      | False (copy bundled set) |
| grub_optional               | Additional options for `GRUB_CMDLINE_LINUX_DEFAULT`.                     | -                        |
| grub_timeout                | Timeout of the default GRUB menu in seconds.                             | 1                        |
| hide_pid                    | Mount /proc with `hidepid=2`. Not advised on desktops.                   | false                    |
| locale                      | For example, "en_GB.UTF-8".                                              | en_AU.UTF8               |
| pkg_install_extra           | Install "extra" packages. Minimal, but useful set of software.           | False                    |
| pkg_remove_defaults         | Remove certain packages that are often installed by default.             | False                    |
| resolver_blocklist          | Optional path to the blocklist _in RPZ format_.                          | ""                       |
| resolver_install            | Install Knot DNS resolver. Recommended to enable.                        | False                    |
| resolver_listen_on_ip       | Address on which Knot will listen.                                       | 127.0.0.1                |
| resolver_primary_hostname   | ...                                                                      | dns.quad9.net            |
| resolver_primary_ip         | Self-explanatory                                                         | 9.9.9.9                  |
| resolver_secondary_hostname | ...                                                                      | dns.quad9.net            |
| resolver_secondary_ip       | ...                                                                      | 149.112.112.112          |
| resolver_tls                | Boolean, forward queries via TCP/TLS or UDP                              | True (TLS)               |
| set_capslock                | Set <kbd>CapsLock</kbd> as <kbd>Ctrl</kbd>.                              | False                    |
| set_dpkg_console            | Sets framebuffer/console: font size, encoding, etc.                      | True                     |
| set_dpkg_overrides          | Tighten various filesystem permissions. Use with care!                   | False                    |
| set_hostname                | Set target's hostname to the `inventory_hostname`                        | False                    |
| set_sigenforce              | Enforce kernel modules signature verification, only with SecureBoot.     | True                     |
| sshd_less_secure            | Enables aes256-cbc cipher and hmac-sha-256 MAC.                          | False                    |
| sshguard_install            | Install and configure `sshguard`                                         | True                     |
| sshguard_path               | Path to sshguard config.                                                 | System default           |
| sudo_cmd_nopwd              | Comma-separated paths that target user can run with passwordless `sudo`. | ""                       |
| sudo_set                    | Configure `sudo`-capable user?                                           | False                    |
| sudo_user                   | Allow this user to run `sudo`, defaults to SSH login unless it is root.  | `ansible_env.USER`       |
| timezone                    | Self-explanatory.                                                        | UTC                      |
| ufw_rule                    | Template for a UFW rule. See below for a detailed explanation.           | []                       |
| ufw_service                 | Template for a UFW service. See below for a detailed explanation.        | []                       |

### ufw_rule

Variable accepts the following list of hashes:

| Variable  | Description           | Default | Required | Possible values                    |
|-----------|-----------------------|---------|----------|------------------------------------|
| comment   | Rule comment.         | ""      | no       | Alphanumerics                      |
| direction | Traffic direction     | "in"    | no       | "in", "out"                        |
| from      | Traffic source        | any     | no       | Network address                    |
| to        | Traffic destination   | any     | no       | Network address                    |
| port      | Port, single or range | any     | no       | integer or "int:int"               |
| proto     | Protocol              | any     | no       | "tcp", "udp", "esp", "gre", "any"  |
| rule      | Action taken          | ""      | yes      | "allow", "deny", "limit", "reject" |

Example:

```yaml
ufw_rule:
  - { comment: 'Drop incoming TCP traffic from 192.168.*.* to port 22/tcp', direction: 'in', from: '192.168.0.0/16', port: '22', proto: 'tcp', rule: 'deny' }
```

Note that if "to" in undefined, it will be interpreted as "to any".

#### Quirks

1. If rule specifies a port range, protocol must be set explicitely to "tcp" or "udp".

### ufw_service

Similar to the above, but provisions service using data from `/etc/ufw/applications.d` and `/etc/services`.
`direction`, `port` and `proto` are replaced with a single variable: `service`.

Example:

```yaml
ufw_rule:
  - { comment: 'Reject Yahoo messenger from 192.168.67.83', rule: 'deny', from: '192.168.67.83', service: 'Yahoo' }
```

Dependencies
------------
None

License
-------
MIT

Author Information
------------------
Andrew Savchenko  
https://savchenko.net
