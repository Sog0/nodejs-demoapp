#!/bin/bash

sudo yum update -y
sudo yum install docker -y
sudo systemctl enable docker
sudo systemctl start docker
sudo docker run -d -p 80:3000 ghcr.io/benc-uk/nodejs-demoapp:latest
