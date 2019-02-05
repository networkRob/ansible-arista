#!/bin/bash
echo "============ Creating Base Lab Environment ================="
echo "[Creating necessary directories]"
mkdir class/group_vars
echo "[Copying base Ansible Files]"
cp completed/ansible.cfg class/
cp completed/hosts class/
echo "============ Done! ================="
