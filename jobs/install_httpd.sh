#!/bin/bash

sudo apt update
sudo yum install httpd

sudo systemctl restart httpd
sudo systemctl enable httpd


