Role Name
=========
Configures Debian installation to be used on a laptop. 

Requirements
------------
Should be installed on a computer that is already provisioned with the [base](https://github.com/savchenko/debian/roles/base/README.md) role.

Role Variables
--------------
| Variable     | Description                     | Default |
|--------------|---------------------------------|---------|
| disable_igfx | Disable iGFX on Intel platform. | False   |

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
