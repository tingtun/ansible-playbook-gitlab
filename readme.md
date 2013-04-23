# ansible-playbook-gitlab

Playbook for installing GitLab 5.1 on Ubuntu (tested with quantal 12.10).

Let's be honest, setting up gitlab is in pain in the ass. This ansible playbook was made to help you deploy GitLab in about 15 minutes with a single command.


## Prerequisites
You need to have sudo installed on the server and Ansible on the client.

You will need to copy `vars.yml.example` to `vars.yml` which contains the domain you would like to use, as the database password.

_The playbooks use the apt module, and for that reason they only work on Debian-based distributions. They are currently only tested on Debian unstable. Patches are welcome for extending support for other platforms. Also, please let me know if the playbooks should happen to work on other configurations, such as Debian testing or Ubuntu Server._

## Installation
Run the following:

    ansible-playbook -vvv gitlab.yml -u ubuntu

Now you should be able to log in with:

    username: admin@local.host
    password: 5iveL!fe

## Contributors

* Alexander Teinum (https://github.com/alexanderte)
* Jake Dahn (http://github.com/jakedahn)

## License
Copyright © 2012 Tingtun

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
