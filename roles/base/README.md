Base
=========
Basic setup of a sensible Debian host. Summary:  
1. Setup Grub and `GRUB_CMDLINE_LINUX_DEFAULT`, enable vendor-specific IOMMU.
2. Setup `dpkg` overrides, `apt` and harden permissions of various paths.
3. Setup locale/timezone, hostname and packages, enable `unattended-upgrades`.
4. Configure `knot-resolver` as the default DNS resolver and `timesyncd` as the NTP client.
5. Configure `sshd` and optionally open TCP/22 with limits applied via `ufw` and `sshguard` watching the login attempts.
6. Optionally generate unique set of moduli for DH key exchange.
7. Configure various sysctl tunables, system and `systemd` settings.
8. Optionally disable bluetooth, thunderbolt, firewire as well as some other kernel modules.
9. Optionally configure Caps Lock key as Control modifier.
10. Reduce preservation times for various logs across the system.
11. If explicitely allowed, automatically reboot system at the end.

Requirements
------------
Ansible ≥2.9  
Debian 11 (might work on its derivatives, however this is not guaranteed)

Role Variables
--------------
`allow_reboot` Automatically reboot target machine if necessary to apply changes. Default is false.  
`allow_ssh` Create "limit" UFW rule for incoming TCP on the port 22. Default is false.  
`disable_speaker` Does what it says, refers to the "internal" beeper only, nothing to do with ALSA. Enabled by default.  
`disable_thunderbolt` Blacklist Thunderbolt kernel modules. [See why](https://thunderspy.io/).  
`disable_firewire` Likewise.  
`disable_bluetooth` Similar story to the above.  
`disable_hfs-udf` ...  
`fstab_noexec` Mounts /dev/shm with nodev, nosuid, and noexec. Default is true.  
`grub_options` Any additional options you might want to add to `GRUB_CMDLINE_LINUX_DEFAULT`.
`timezone` self-explanatory. Default is "UTC"  
`locale` for example, "en_GB.UTF-8"  
`set_capslock`  set CapsLock as Ctrl  
`sshguard_path` path to sshguard config. Default is `/etc/sshguard/sshguard.conf`  
`sshd_less_secure` enables aes256-cbc cipher and hmac-sha-256 MAC. Might be useful for outdated clients.  
`generate_moduli` generate new set of 4096 moduli on the target host or copy pre-calculated ones. Either is better than the default set.
`resolver_listen_on_ip` address on which Knot will listen. In most cases, you want this to be `127.0.0.1`.  
`resolver_tls` boolean, forward queries via TCP/TLS or UDP  
`resolver_blocklist` optional path to the blocklist _in RPZ format_.  
`resolver_primary_ip` self-explanatory  
`resolver_secondary_ip` --  
`resolver_primary_hostname` --  
`resolver_secondary_hostname` --  

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
