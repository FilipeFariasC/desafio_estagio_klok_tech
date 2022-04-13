#!/bin/env bash

sudo rabbitmqctl add_user klok_dev_est klokdevest
sudo rabbitmqctl set_user_tags klok_dev_est administrator
sudo rabbitmqctl set_permissions -p / klok_dev_est ".*" ".*" ".*"