# Laptop

Installs various userland software

## Notes

Everything is rather straightforward, see an example playbook for reference.

### Tor

`torbrowser-launcher` does not work on Wayland as Firefox in this package is compiled without the `MOZ_ENABLE_WAYLAND`.
`torsocks` can be used to route an arbitrary application via Tor.

## Requirements

Ansible ≥2.9  
Debian 11 (might work on its derivatives, however this is not guaranteed)

## Role Variables

| Variable                   | Description                                   | Default |
|----------------------------|-----------------------------------------------|---------|
| virtio_network_autostart   | Autostart default virtio network on boot.     | true    |
| virtio_use_default_network | Use NAT-based, "default" virtio setup.        | true    |
| setup_dev                  | Install development tools.                    | true    |
| setup_fonts                | Install fonts.                                | true    |
| setup_fs                   | Install FUSE / filesystems support.           | true    |
| setup_internet             | Install internet packages (e.g. web-browser). | true    |
| setup_libvirt              | Install and configure libvirt/virt-manager.   | true    |
| setup_multimedia           | Install multimedia tools: audio/video/images. | true    |
| setup_office               | Install office applications.                  | true    |
| setup_utils                | Install various utilities.                    | true    |
| setup_wayland              | Install Wayland/Sway desktop.                 | true    |


## Dependencies
It is *strongly* advised to install on a computer that is already provisioned with the [base](https://github.com/savchenko/debian/roles/base/README.md) role.amd64-microcode

## License
MIT

## Author Information
Andrew Savchenko  
https://savchenko.net
