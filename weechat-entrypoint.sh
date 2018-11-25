#!/bin/bash

echo "$(date) Starting weechat in screen..."
screen -d -m weechat

echo "$(date) Starting SSHD..."
/usr/sbin/sshd -D

echo "$(echo) Entry point exit!"

