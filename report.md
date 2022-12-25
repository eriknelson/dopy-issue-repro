##### SUMMARY
I am using Arch Linux and would like to use `pyenv` and `virtualenv` to keep
my projects clean. I'm trying to use the DO collection to spawn some infra, but
I am getting the following error despite having `dopy==0.3.7` installed into
the virutalenv. If I revert to `0.3.6`, it actually finds it, but I'm unable
to spawn droplets as it complains about the usage of `basestring` in `dopy`
(I want to use python3).

```
MSG:

dopy >= 0.3.2 required for this module
```

##### ISSUE TYPE
- Bug Report

##### COMPONENT NAME
<!--- Write the short name of the module, plugin, task or feature below, use your best guess if unsure -->
`community.digitalocean.digital_ocean`, although all of the modules seem to
be affected by the same problem.

##### ANSIBLE VERSION
<!--- Paste verbatim output from "ansible --version" between quotes -->
```paste below
ansible [core 2.14.1]
  config file = /git/dopy-issue-repro/playbooks/ansible.cfg
  configured module search path = ['/home/ernelson/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /git/dopy-issue-repro/.venv/lib/python3.10/site-packages/ansible
  ansible collection location = /git/dopy-issue-repro/.venv/lib/python3.10/site-packages/ansible_collections
  executable location = /git/dopy-issue-repro/.venv/bin/ansible
  python version = 3.10.8 (main, Nov 23 2022, 19:29:54) [GCC 12.2.0] (/git/dopy-issue-repro/.venv/bin/python)
  jinja version = 3.1.2
  libyaml = True
```

##### COLLECTION VERSION
<!--- Paste verbatim output from "ansible-galaxy collection list <namespace>.<collection>"  between the quotes
for example: ansible-galaxy collection list community.general
-->
```paste below
# /git/dopy-issue-repro/.venv/lib/python3.10/site-packages/ansible_collections
Collection                    Version
----------------------------- -------
amazon.aws                    5.1.0
ansible.netcommon             4.1.0
ansible.posix                 1.4.0
ansible.utils                 2.8.0
ansible.windows               1.12.0
arista.eos                    6.0.0
awx.awx                       21.10.0
azure.azcollection            1.14.0
check_point.mgmt              4.0.0
chocolatey.chocolatey         1.3.1
cisco.aci                     2.3.0
cisco.asa                     4.0.0
cisco.dnac                    6.6.1
cisco.intersight              1.0.22
cisco.ios                     4.0.0
cisco.iosxr                   4.0.3
cisco.ise                     2.5.9
cisco.meraki                  2.13.0
cisco.mso                     2.1.0
cisco.nso                     1.0.3
cisco.nxos                    4.0.1
cisco.ucs                     1.8.0
cloud.common                  2.1.2
cloudscale_ch.cloud           2.2.3
community.aws                 5.0.0
community.azure               2.0.0
community.ciscosmb            1.0.5
community.crypto              2.9.0
community.digitalocean        1.22.0
community.dns                 2.4.2
community.docker              3.3.1
community.fortios             1.0.0
community.general             6.1.0
community.google              1.0.0
community.grafana             1.5.3
community.hashi_vault         4.0.0
community.hrobot              1.6.0
community.libvirt             1.2.0
community.mongodb             1.4.2
community.mysql               3.5.1
community.network             5.0.0
community.okd                 2.2.0
community.postgresql          2.3.1
community.proxysql            1.4.0
community.rabbitmq            1.2.3
community.routeros            2.5.0
community.sap                 1.0.0
community.sap_libs            1.4.0
community.skydive             1.0.0
community.sops                1.5.0
community.vmware              3.2.0
community.windows             1.11.1
community.zabbix              1.9.0
containers.podman             1.10.1
cyberark.conjur               1.2.0
cyberark.pas                  1.0.14
dellemc.enterprise_sonic      2.0.0
dellemc.openmanage            6.3.0
dellemc.os10                  1.1.1
dellemc.os6                   1.0.7
dellemc.os9                   1.0.4
f5networks.f5_modules         1.21.0
fortinet.fortimanager         2.1.7
fortinet.fortios              2.2.1
frr.frr                       2.0.0
gluster.gluster               1.0.2
google.cloud                  1.0.2
grafana.grafana               1.1.0
hetzner.hcloud                1.9.0
hpe.nimble                    1.1.4
ibm.qradar                    2.1.0
ibm.spectrum_virtualize       1.10.0
infinidat.infinibox           1.3.12
infoblox.nios_modules         1.4.1
inspur.ispim                  1.2.0
inspur.sm                     2.3.0
junipernetworks.junos         4.1.0
kubernetes.core               2.3.2
lowlydba.sqlserver            1.2.1
mellanox.onyx                 1.0.0
netapp.aws                    21.7.0
netapp.azure                  21.10.0
netapp.cloudmanager           21.21.0
netapp.elementsw              21.7.0
netapp.ontap                  22.0.1
netapp.storagegrid            21.11.1
netapp.um_info                21.8.0
netapp_eseries.santricity     1.3.1
netbox.netbox                 3.9.0
ngine_io.cloudstack           2.3.0
ngine_io.exoscale             1.0.0
ngine_io.vultr                1.1.2
openstack.cloud               1.10.0
openvswitch.openvswitch       2.1.0
ovirt.ovirt                   2.4.1
purestorage.flasharray        1.15.0
purestorage.flashblade        1.10.0
purestorage.fusion            1.2.0
sensu.sensu_go                1.13.1
splunk.es                     2.1.0
t_systems_mms.icinga_director 1.31.4
theforeman.foreman            3.7.0
vmware.vmware_rest            2.2.0
vultr.cloud                   1.3.1
vyos.vyos                     4.0.0
wti.remote                    1.0.4
```

##### CONFIGURATION
<!--- Paste verbatim output from "ansible-config dump --only-changed" between quotes -->
```paste below
ACTION_WARNINGS(default) = True
AGNOSTIC_BECOME_PROMPT(default) = True
ANSIBLE_CONNECTION_PATH(default) = None
ANSIBLE_COW_ACCEPTLIST(default) = ['bud-frogs', 'bunny', 'cheese', 'daemon', 'default', 'dragon', 'elephant-in-snake', 'elephant', 'eyes', 'hellokitty', 'kitty', 'luke-koala', 'meow', 'milk', 'moofasa', 'moose', 'ren', 'sheep', 'small', 'stegosaurus', 'stimpy', 'supermilker', 'three-eyes', 'turkey', 'turtle', 'tux', 'udder', 'vader-koala', 'vader', 'www']
ANSIBLE_COW_PATH(default) = None
ANSIBLE_COW_SELECTION(default) = default
ANSIBLE_FORCE_COLOR(default) = False
ANSIBLE_HOME(default) = /home/ernelson/.ansible
ANSIBLE_NOCOLOR(default) = False
ANSIBLE_NOCOWS(default) = False
ANSIBLE_PIPELINING(default) = False
ANY_ERRORS_FATAL(default) = False
BECOME_ALLOW_SAME_USER(default) = False
BECOME_PASSWORD_FILE(default) = None
BECOME_PLUGIN_PATH(default) = ['/home/ernelson/.ansible/plugins/become', '/usr/share/ansible/plugins/become']
CACHE_PLUGIN(default) = memory
CACHE_PLUGIN_CONNECTION(default) = None
CACHE_PLUGIN_PREFIX(default) = ansible_facts
CACHE_PLUGIN_TIMEOUT(default) = 86400
CALLBACKS_ENABLED(default) = []
COLLECTIONS_ON_ANSIBLE_VERSION_MISMATCH(default) = warning
COLLECTIONS_PATHS(env: ANSIBLE_COLLECTIONS_PATH) = ['/git/dopy-issue-repro/.venv/lib/python3.10/site-packages/ansible_collections']
COLLECTIONS_SCAN_SYS_PATH(default) = True
COLOR_CHANGED(default) = yellow
COLOR_CONSOLE_PROMPT(default) = white
COLOR_DEBUG(default) = dark gray
COLOR_DEPRECATE(default) = purple
COLOR_DIFF_ADD(default) = green
COLOR_DIFF_LINES(default) = cyan
COLOR_DIFF_REMOVE(default) = red
COLOR_ERROR(default) = red
COLOR_HIGHLIGHT(default) = white
COLOR_OK(default) = green
COLOR_SKIP(default) = cyan
COLOR_UNREACHABLE(default) = bright red
COLOR_VERBOSE(default) = blue
COLOR_WARN(default) = bright purple
CONFIG_FILE() = /git/dopy-issue-repro/playbooks/ansible.cfg
CONNECTION_FACTS_MODULES(default) = {'asa': 'ansible.legacy.asa_facts', 'cisco.asa.asa': 'cisco.asa.asa_facts', 'eos': 'ansible.legacy.eos_facts', 'arista.eos.eos': 'arista.eos.eos_facts', 'frr': 'ansible.legacy.frr_facts', 'frr.frr.frr': 'frr.frr.frr_facts', 'ios': 'ansible.legacy.ios_facts', 'cisco.ios.ios': 'cisco.ios.ios_facts', 'iosxr': 'ansible.legacy.iosxr_facts', 'cisco.iosxr.iosxr': 'cisco.iosxr.iosxr_facts', 'junos': 'ansible.legacy.junos_facts', 'junipernetworks.junos.junos': 'junipernetworks.junos.junos_facts', 'nxos': 'ansible.legacy.nxos_facts', 'cisco.nxos.nxos': 'cisco.nxos.nxos_facts', 'vyos': 'ansible.legacy.vyos_facts', 'vyos.vyos.vyos': 'vyos.vyos.vyos_facts', 'exos': 'ansible.legacy.exos_facts', 'extreme.exos.exos': 'extreme.exos.exos_facts', 'slxos': 'ansible.legacy.slxos_facts', 'extreme.slxos.slxos': 'extreme.slxos.slxos_facts', 'voss': 'ansible.legacy.voss_facts', 'extreme.voss.voss': 'extreme.voss.voss_facts', 'ironware': 'ansible.legacy.ironware_facts', 'community.network.ironware': 'community.network.ironware_facts'}
CONNECTION_PASSWORD_FILE(default) = None
COVERAGE_REMOTE_OUTPUT(default) = None
COVERAGE_REMOTE_PATHS(default) = *
DEFAULT_ACTION_PLUGIN_PATH(default) = ['/home/ernelson/.ansible/plugins/action', '/usr/share/ansible/plugins/action']
DEFAULT_ALLOW_UNSAFE_LOOKUPS(default) = False
DEFAULT_ASK_PASS(default) = False
DEFAULT_ASK_VAULT_PASS(default) = False
DEFAULT_BECOME(default) = False
DEFAULT_BECOME_ASK_PASS(default) = False
DEFAULT_BECOME_EXE(default) = None
DEFAULT_BECOME_FLAGS(default) = None
DEFAULT_BECOME_METHOD(default) = sudo
DEFAULT_BECOME_USER(default) = root
DEFAULT_CACHE_PLUGIN_PATH(default) = ['/home/ernelson/.ansible/plugins/cache', '/usr/share/ansible/plugins/cache']
DEFAULT_CALLBACK_PLUGIN_PATH(default) = ['/home/ernelson/.ansible/plugins/callback', '/usr/share/ansible/plugins/callback']
DEFAULT_CLICONF_PLUGIN_PATH(default) = ['/home/ernelson/.ansible/plugins/cliconf', '/usr/share/ansible/plugins/cliconf']
DEFAULT_CONNECTION_PLUGIN_PATH(default) = ['/home/ernelson/.ansible/plugins/connection', '/usr/share/ansible/plugins/connection']
DEFAULT_DEBUG(default) = False
DEFAULT_EXECUTABLE(default) = /bin/sh
DEFAULT_FACT_PATH(default) = None
DEFAULT_FILTER_PLUGIN_PATH(default) = ['/home/ernelson/.ansible/plugins/filter', '/usr/share/ansible/plugins/filter']
DEFAULT_FORCE_HANDLERS(default) = False
DEFAULT_FORKS(default) = 5
DEFAULT_GATHERING(/git/dopy-issue-repro/playbooks/ansible.cfg) = smart
DEFAULT_GATHER_SUBSET(default) = None
DEFAULT_GATHER_TIMEOUT(default) = None
DEFAULT_HASH_BEHAVIOUR(default) = replace
DEFAULT_HOST_LIST(/git/dopy-issue-repro/playbooks/ansible.cfg) = ['/git/dopy-issue-repro/playbooks/inventory']
DEFAULT_HTTPAPI_PLUGIN_PATH(default) = ['/home/ernelson/.ansible/plugins/httpapi', '/usr/share/ansible/plugins/httpapi']
DEFAULT_INTERNAL_POLL_INTERVAL(default) = 0.001
DEFAULT_INVENTORY_PLUGIN_PATH(default) = ['/home/ernelson/.ansible/plugins/inventory', '/usr/share/ansible/plugins/inventory']
DEFAULT_JINJA2_EXTENSIONS(default) = []
DEFAULT_JINJA2_NATIVE(default) = False
DEFAULT_KEEP_REMOTE_FILES(default) = False
DEFAULT_LIBVIRT_LXC_NOSECLABEL(default) = False
DEFAULT_LOAD_CALLBACK_PLUGINS(default) = False
DEFAULT_LOCAL_TMP(default) = /home/ernelson/.ansible/tmp/ansible-local-1191433oesffew
DEFAULT_LOG_FILTER(default) = []
DEFAULT_LOG_PATH(default) = None
DEFAULT_LOOKUP_PLUGIN_PATH(default) = ['/home/ernelson/.ansible/plugins/lookup', '/usr/share/ansible/plugins/lookup']
DEFAULT_MANAGED_STR(default) = Ansible managed
DEFAULT_MODULE_ARGS(default) = None
DEFAULT_MODULE_COMPRESSION(default) = ZIP_DEFLATED
DEFAULT_MODULE_NAME(default) = command
DEFAULT_MODULE_PATH(default) = ['/home/ernelson/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
DEFAULT_MODULE_UTILS_PATH(default) = ['/home/ernelson/.ansible/plugins/module_utils', '/usr/share/ansible/plugins/module_utils']
DEFAULT_NETCONF_PLUGIN_PATH(default) = ['/home/ernelson/.ansible/plugins/netconf', '/usr/share/ansible/plugins/netconf']
DEFAULT_NO_LOG(default) = False
DEFAULT_NO_TARGET_SYSLOG(default) = False
DEFAULT_NULL_REPRESENTATION(default) = None
DEFAULT_POLL_INTERVAL(default) = 15
DEFAULT_PRIVATE_KEY_FILE(default) = None
DEFAULT_PRIVATE_ROLE_VARS(default) = False
DEFAULT_REMOTE_PORT(default) = None
DEFAULT_REMOTE_USER(default) = None
DEFAULT_ROLES_PATH(env: ANSIBLE_ROLES_PATH) = ['/git/dopy-issue-repro/shared-roles']
DEFAULT_SELINUX_SPECIAL_FS(default) = ['fuse', 'nfs', 'vboxsf', 'ramfs', '9p', 'vfat']
DEFAULT_STDOUT_CALLBACK(/git/dopy-issue-repro/playbooks/ansible.cfg) = debug
DEFAULT_STRATEGY(default) = linear
DEFAULT_STRATEGY_PLUGIN_PATH(default) = ['/home/ernelson/.ansible/plugins/strategy', '/usr/share/ansible/plugins/strategy']
DEFAULT_SU(default) = False
DEFAULT_SYSLOG_FACILITY(default) = LOG_USER
DEFAULT_TERMINAL_PLUGIN_PATH(default) = ['/home/ernelson/.ansible/plugins/terminal', '/usr/share/ansible/plugins/terminal']
DEFAULT_TEST_PLUGIN_PATH(default) = ['/home/ernelson/.ansible/plugins/test', '/usr/share/ansible/plugins/test']
DEFAULT_TIMEOUT(default) = 10
DEFAULT_TRANSPORT(default) = smart
DEFAULT_UNDEFINED_VAR_BEHAVIOR(default) = True
DEFAULT_VARS_PLUGIN_PATH(default) = ['/home/ernelson/.ansible/plugins/vars', '/usr/share/ansible/plugins/vars']
DEFAULT_VAULT_ENCRYPT_IDENTITY(default) = None
DEFAULT_VAULT_IDENTITY(default) = default
DEFAULT_VAULT_IDENTITY_LIST(default) = []
DEFAULT_VAULT_ID_MATCH(default) = False
DEFAULT_VAULT_PASSWORD_FILE(default) = None
DEFAULT_VERBOSITY(default) = 0
DEPRECATION_WARNINGS(default) = True
DEVEL_WARNING(default) = True
DIFF_ALWAYS(default) = False
DIFF_CONTEXT(default) = 3
DISPLAY_ARGS_TO_STDOUT(default) = False
DISPLAY_SKIPPED_HOSTS(default) = True
DOCSITE_ROOT_URL(default) = https://docs.ansible.com/ansible-core/
DOC_FRAGMENT_PLUGIN_PATH(default) = ['/home/ernelson/.ansible/plugins/doc_fragments', '/usr/share/ansible/plugins/doc_fragments']
DUPLICATE_YAML_DICT_KEY(default) = warn
ENABLE_TASK_DEBUGGER(default) = False
ERROR_ON_MISSING_HANDLER(default) = True
FACTS_MODULES(default) = ['smart']
GALAXY_CACHE_DIR(default) = /home/ernelson/.ansible/galaxy_cache
GALAXY_COLLECTION_SKELETON(default) = None
GALAXY_COLLECTION_SKELETON_IGNORE(default) = ['^.git$', '^.*/.git_keep$']
GALAXY_DISABLE_GPG_VERIFY(default) = False
GALAXY_DISPLAY_PROGRESS(default) = None
GALAXY_GPG_KEYRING(default) = None
GALAXY_IGNORE_CERTS(default) = None
GALAXY_IGNORE_INVALID_SIGNATURE_STATUS_CODES(default) = None
GALAXY_REQUIRED_VALID_SIGNATURE_COUNT(default) = 1
GALAXY_ROLE_SKELETON(default) = None
GALAXY_ROLE_SKELETON_IGNORE(default) = ['^.git$', '^.*/.git_keep$']
GALAXY_SERVER(default) = https://galaxy.ansible.com
GALAXY_SERVER_LIST(default) = None
GALAXY_TOKEN_PATH(default) = /home/ernelson/.ansible/galaxy_token
HOST_KEY_CHECKING(/git/dopy-issue-repro/playbooks/ansible.cfg) = False
HOST_PATTERN_MISMATCH(default) = warning
INJECT_FACTS_AS_VARS(default) = True
INTERPRETER_PYTHON(default) = auto
INTERPRETER_PYTHON_FALLBACK(default) = ['python3.11', 'python3.10', 'python3.9', 'python3.8', 'python3.7', 'python3.6', 'python3.5', '/usr/bin/python3', '/usr/libexec/platform-python', 'python2.7', '/usr/bin/python', 'python']
INVALID_TASK_ATTRIBUTE_FAILED(default) = True
INVENTORY_ANY_UNPARSED_IS_FAILED(default) = False
INVENTORY_CACHE_ENABLED(default) = False
INVENTORY_CACHE_PLUGIN(default) = None
INVENTORY_CACHE_PLUGIN_CONNECTION(default) = None
INVENTORY_CACHE_PLUGIN_PREFIX(default) = ansible_inventory_
INVENTORY_CACHE_TIMEOUT(default) = 3600
INVENTORY_ENABLED(default) = ['host_list', 'script', 'auto', 'yaml', 'ini', 'toml']
INVENTORY_EXPORT(default) = False
INVENTORY_IGNORE_EXTS(default) = ('.pyc', '.pyo', '.swp', '.bak', '~', '.rpm', '.md', '.txt', '.rst', '.orig', '.ini', '.cfg', '.retry')
INVENTORY_IGNORE_PATTERNS(default) = []
INVENTORY_UNPARSED_IS_FAILED(default) = False
INVENTORY_UNPARSED_WARNING(default) = True
JINJA2_NATIVE_WARNING(default) = True
LOCALHOST_WARNING(default) = True
MAX_FILE_SIZE_FOR_DIFF(default) = 104448
MODULE_IGNORE_EXTS(default) = ('.pyc', '.pyo', '.swp', '.bak', '~', '.rpm', '.md', '.txt', '.rst', '.yaml', '.yml', '.ini')
NETCONF_SSH_CONFIG(default) = None
NETWORK_GROUP_MODULES(default) = ['eos', 'nxos', 'ios', 'iosxr', 'junos', 'enos', 'ce', 'vyos', 'sros', 'dellos9', 'dellos10', 'dellos6', 'asa', 'aruba', 'aireos', 'bigip', 'ironware', 'onyx', 'netconf', 'exos', 'voss', 'slxos']
OLD_PLUGIN_CACHE_CLEARING(default) = False
PARAMIKO_HOST_KEY_AUTO_ADD(default) = False
PARAMIKO_LOOK_FOR_KEYS(default) = True
PERSISTENT_COMMAND_TIMEOUT(default) = 30
PERSISTENT_CONNECT_RETRY_TIMEOUT(default) = 15
PERSISTENT_CONNECT_TIMEOUT(default) = 30
PERSISTENT_CONTROL_PATH_DIR(default) = /home/ernelson/.ansible/pc
PLAYBOOK_DIR(default) = None
PLAYBOOK_VARS_ROOT(default) = top
PLUGIN_FILTERS_CFG(default) = None
PYTHON_MODULE_RLIMIT_NOFILE(default) = 0
RETRY_FILES_ENABLED(/git/dopy-issue-repro/playbooks/ansible.cfg) = False
RETRY_FILES_SAVE_PATH(default) = None
RUN_VARS_PLUGINS(default) = demand
SHOW_CUSTOM_STATS(default) = False
STRING_CONVERSION_ACTION(default) = warn
STRING_TYPE_FILTERS(default) = ['string', 'to_json', 'to_nice_json', 'to_yaml', 'to_nice_yaml', 'ppretty', 'json']
SYSTEM_WARNINGS(default) = True
TAGS_RUN(default) = []
TAGS_SKIP(default) = []
TASK_DEBUGGER_IGNORE_ERRORS(default) = True
TASK_TIMEOUT(default) = 0
TRANSFORM_INVALID_GROUP_CHARS(default) = never
USE_PERSISTENT_CONNECTIONS(default) = False
VALIDATE_ACTION_GROUP_METADATA(default) = True
VARIABLE_PLUGINS_ENABLED(default) = ['host_group_vars']
VARIABLE_PRECEDENCE(default) = ['all_inventory', 'groups_inventory', 'all_plugins_inventory', 'all_plugins_play', 'groups_plugins_inventory', 'groups_plugins_play']
VERBOSE_TO_STDERR(default) = False
WIN_ASYNC_STARTUP_TIMEOUT(default) = 5
WORKER_SHUTDOWN_POLL_COUNT(default) = 0
WORKER_SHUTDOWN_POLL_DELAY(default) = 0.1
YAML_FILENAME_EXTENSIONS(default) = ['.yml', '.yaml', '.json']
```

##### OS / ENVIRONMENT
OS: Arch Linux
Python: pyenv installed 3.10.8
pip: `pip 22.2.2 from /home/ernelson/.pyenv/versions/3.10.8/lib/python3.10/site-packages/pip (python 3.10)`
virtualenv: `virtualenv 20.17.1 from /home/ernelson/.pyenv/versions/3.10.8/lib/python3.10/site-packages/virtualenv/__init__.py`

##### STEPS TO REPRODUCE
See https://github.com/eriknelson/dopy-issue-repro for a repository with instructions
to reproduce. It's as close to what I considered essential extracted from a
much larger project of mine.

##### EXPECTED RESULTS
`dopy` should be recognizable as installed, and I should be able to use the pyenv
installed python3 with my virtualenv.

##### ACTUAL RESULTS
```paste below
MSG:

dopy >= 0.3.2 required for this module
```
