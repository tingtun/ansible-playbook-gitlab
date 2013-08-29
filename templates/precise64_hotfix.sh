#!/bin/bash
sudo rm /home/git/gitlab/tmp/sockets/gitlab.socket
sudo /etc/init.d/gitlab start
