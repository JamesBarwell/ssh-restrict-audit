ssh-restrict-audit
------

A tool to restrict the SSH commands a user can run, and provide auditing capabilities.

Additionally this project contains example configuration for enabling 2FA using google-authenticator. The project is intended for use on a bastion host, to provide secure 2FA access, with audit, into an internal environment.

This solution makes use of the SSH ForceCommand to force a user into running the script. This requires that user's are authenticating themselves to the host using keys.

## How to use

An Ansible playbook is provided which will automatically set up an Ubuntu host. You can either use it directly, or study it as a reference for where the included files need to go.

### Ansible set up

* install Ansible
* create a file `hosts` with the IP or URL of your host
* adjust the included Makefile to contain your access credentials to the host
* run `make setup-ssh`
* log into the host
* set up the admin google-auth by running: `google-authenticator`. Record the credentials and recovery tokens.

### Ansible lockdown

* run `make setup-ssh-lockdown`
* log into the host, and restart ssh: `service ssh restart`

### Add a user

* scp the user's public key to the host
* log into the host as the admin user
* run `add_ssh_user <username> <path/to/public_key>`

### Remove a user

* log into the host as the admin user
* run `remove_ssh_user <username>`

## Credits

This script adds extra functionality to [mexy's restrict-ssh](https://github.com/mxey/ssh-restrict) script, which in turn was based on [derf's ssh-forcecommand](https://github.com/derf/ssh-forcecommand), so my thanks to them.
