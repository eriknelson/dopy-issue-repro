TL; DR: I'm using pyenv with virtualenv on Arch Linux and want to use the latest
`community.digitalocean` collection with ansible running from the venv. Regardless
of attempting to set the `ansible_python_interpreter=python` (which most of
google suggests is the issue), I don't believe this to be the problem based
on the `-vvvv` output, where it appears to be using the right interpreter.
The following is the complaint:

```
MSG:

dopy >= 0.3.2 required for this module
```

# Relevant version info

OS: Arch Linux
Python: pyenv installed 3.10.8
pip: `pip 22.2.2 from /home/ernelson/.pyenv/versions/3.10.8/lib/python3.10/site-packages/pip (python 3.10)`
virtualenv: `virtualenv 20.17.1 from /home/ernelson/.pyenv/versions/3.10.8/lib/python3.10/site-packages/virtualenv/__init__.py`

# Reproducer Steps

* Create a file at the checkout root called `vault-pass.txt` with a desired vault passphrase.
* Navigate to `playbooks/` and create an initial `my_vars.yml` copying from `my_vars.yml.ex`
* Create a new ssh key in desired location (I used `~/.ssh`)
* Update `my_vars.yml` to set the location where the new ssh key was created and also set
the var with the name of the private key. Set `ssh_key_email` to be the one set when
creating the ssh key.
* Create a new API key with Digital Ocean
* Create a `do.vault` file in `playbooks/` using ansible-vault with a single var called `do_api_key`. This
should have the contents of your new DO API key.
* Install and configure `pyenv`
* `pyenv install 3.10.8 && pyenv global 3.10.8`
* `pip install virtualenv`
* `cd $REPO_CLONE_PATH`
* `virtualenv .venv && source ./.venv/bin/activate`
* `pip install -r requirements.txt`
* `export ANSIBLE_COLLECTIONS_PATH=$(pwd)/.venv/lib/python3.10/site-packages/ansible_collections`
* `cd playbooks`
* `./up.sh`
