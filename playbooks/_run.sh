#!/bin/bash
_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

MAIN_USER="blog"

export ANSIBLE_ROLES_PATH=$_dir/../shared-roles

ansible-playbook -vvvv -i $_dir/inventory \
  --vault-password-file $_dir/../vault-pass.txt \
  -e="blog_state=$blogState" \
  -e@$_dir/do.vault \
  -e@$_dir/my_vars.yml \
  $_dir/main.yml
