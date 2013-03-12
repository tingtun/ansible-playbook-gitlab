# gitlab-ansible

These playbooks installs GitLab 4.2 on Debian unstable.

GitLab is a truly awesome platform for doing development within a business, but
setting it up manually is tiring and error-prone as it requires many steps
that needs to be executed. This Ansible playbook aims to solve this problem by
significally reducing the amount of steps.

To make it as easy as possible to maintain this playbook, it is structured as
closely as possible to the GitLab documentation. At some places in the
documentation, some interactivity is required, and for that reason the playbook
is split into parts.

## Prerequisites
You need to have sudo installed on the remote host and Ansible on the client.
Run apt-get update and apt-get upgrade before proceeding.

The apt module is used, and for that reason the playbooks only work on Debian-
based distributions. The playbooks are currently only tested on Debian unstable.

Patches are welcome for extending support for other platforms. Also, please
report if the playbooks should happen to work on other configurations.

## Installation
You need to pass the appropriate flags for SSH and sudo to ansible-playbook,
and which are appropriate depends on your local and remote configuration. The
playbooks installs GitLab on all hosts in group gitlab.

Run the following:

    ansible-playbook 0.yml

After 0.yml has completed, then log in to the server and do:

    sudo -u gitlab -H ssh git@localhost
    sudo -u gitlab -H ssh git@host-of-server

Edit vars.yml in this playbook repository and change the database password. Now,
run:

    ansible-playbook 1.yml

Log into the server as gitlab, and change both production username to github and
password to the password you set in vars.yml:

    vi /home/gitlab/gitlab/config/database.yml

Also edit set the gitlab host and gitolite ssh_host to the hostname of the
machine.

**You only want to run the following playbook once, as it initializes the database.**

    ansible-playbook 2.yml

Note that the following playbook disables default Nginx site by removing the
default symlink. This should not be a problem when installed on a new server.

    ansible-playbook 3.yml

Log in to the server and adjust the Nginx configuration:

    vi /etc/nginx/sites-available/gitlab

    listen 80;
    server_name localhost;

Run the last playbook that restarts Nginx:

    ansible-playbook 4.yml

Now you should be able to log in with username admin@local.host and password
5iveL!fe – change it once you’ve logged in.
