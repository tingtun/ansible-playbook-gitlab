# ansible-playbook-gitlab

Playbook for installing GitLab 7.1-stable on Ubuntu (tested with 12.04 i686 and 14.04 amd64).

Let's be honest, setting up gitlab is in pain in the ass. This ansible playbook was made to help you deploy GitLab in about 15 minutes with a single command.


## Prerequisites
You need to have sudo installed on the server and Ansible on the client.

You need to copy `vars.yml.example` to `vars.yml` which contains the domain you would like to use, as the database password.

_The playbooks use the apt module, and for that reason they only work on Debian-based distributions. They are currently only tested on Debian unstable. Patches are welcome for extending support for other platforms. Also, please let me know if the playbooks should happen to work on other configurations, such as Debian testing or Ubuntu Server._

## Installation

Run the following:

    ansible-playbook -vvv gitlab.yml -u ubuntu

The first time you will access the server, the loading time of the page will be quite long (>30s).
Once properly loaded, you should be able to log in with:

    username: root
    password: 5iveL!fe

## Next steps :

### Precompile assets :
At the time of this writing, the asset precompile phase is not working in the ansible playbook
Please run on the gitlab server (as git), the following commands :
cd /home/git/gitlab
sudo -u git -H bundle exec rake assets:precompile RAILS_ENV=production

### Configure SMTP-out :
In order to configure SMTP-OUT, please copy the template config file and adjust the values accordingly
cp /home/git/gitlab/config/initializers/smtp_settings.rb.sample /home/git/gitlab/config/initializers/smtp_settings.rb
Edit the /home/git/gitlab/config/initializers/smtp_settings.rb according to your environment

## Contributors

* Benoît des Ligneris (https://github.com/bligneri)
* Alexander Teinum (https://github.com/alexanderte)
* Jake Dahn (http://github.com/jakedahn)

## License
Copyright © 2012 Tingtun
Copyright © 2014 SMLT

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
