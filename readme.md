# ansible-playbook-gitlab

Playbook for installing GitLab 4.2 on Debian unstable.

GitLab is a truly awesome platform for doing development within a business, but setting it up manually is tiring and error-prone as it requires many steps that needs to be executed. This Ansible playbook aims to solve this problem by significantly reducing the amount of steps.

To make it as easy as possible to maintain this playbook, it is structured as closely as possible to the GitLab documentation. At some places in the documentation, some interactivity is required, and for that reason the playbook is split into parts.

## Prerequisites
You need to have sudo installed on the server and Ansible on the client. Also, run `apt-get update` and `apt-get upgrade` on the server before proceeding.

You need to pass the appropriate flags for SSH and sudo to `ansible-playbook`, and which are appropriate depends on your local and remote configuration. The playbooks installs GitLab on all hosts in group gitlab. So you should add one or many hosts belonging to the group gitlab to /etc/ansible/hosts.

_The playbooks use the apt module, and for that reason they only work on Debian-based distributions. They are currently only tested on Debian unstable. Patches are welcome for extending support for other platforms. Also, please let me know if the playbooks should happen to work on other configurations, such as Debian testing or Ubuntu Server._

## Installation
Run the following:

    ansible-playbook 0.yml

Log in to the server and do:

    sudo -u gitlab -H ssh git@localhost
    sudo -u gitlab -H ssh git@host-of-server

Before running the following playbook, edit vars.yml in this playbook repository, and change the database password. Then run:

    ansible-playbook 1.yml

Log into the server as gitlab, and change both production username to github and password to the password you set in vars.yml:

    vi /home/gitlab/gitlab/config/database.yml

Also edit set the gitlab host and gitolite ssh_host to the hostname of the machine.

**You only want to run the following playbook once, as it initializes the database.**

    ansible-playbook 2.yml

Note that the following playbook disables default Nginx site by removing the default symlink. This should not be a problem unless you use Nginx on the same server for hosting other websites.

    ansible-playbook 3.yml

Log in to the server and adjust the Nginx configuration:

    vi /etc/nginx/sites-available/gitlab

    listen 80;
    server_name localhost;

Run the last playbook that restarts Nginx:

    ansible-playbook 4.yml

Now you should be able to log in with username admin@local.host and password 5iveL!fe – change it once you’ve logged in.

## License
Copyright © 2012 Tingtun

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
