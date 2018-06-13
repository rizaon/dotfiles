#!/bin/bash

sudo postmap /etc/postfix/sasl_passwd
sudo postfix stop && sudo postfix start

