# vim: set ft=yaml:

# The path to where the public and private ssh keys live
ssh_key_path: /home/user/.ssh
# The name of the private ssh key file within the above directory
ssh_key_name: myblog
# Shouldn't have to edit these, derived by the key path and name vars, but you
# can override these values
ssh_key_private_file: "{{ ssh_key_path }}/{{ ssh_key_name }}"
ssh_key_public_file: "{{ ssh_key_path }}/{{ ssh_key_name }}.pub"
