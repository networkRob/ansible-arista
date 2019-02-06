## Arista + Ansible Lab
This repo is to be used with the Arista Test Drive labs. To use this repo, clone it to the labvm within the Arista Test Drive as the `aristagui` user.  The labguides will need to be built as well.  Run the following commands to get the lab and to build the documentation.

```
ssh aristagui@xxx.xxx.xxx.xxx
cd Documents
git clone https://github.com/networkRob/ansible-arista.git
cd ansible-arista
ansible-playbook main.yml -K
```

### Labs section
There are two directories included in the `labs` directory:

- `labs/class/` This is the working directory for the lab.
- `labs/completed/` This contains all files for the completed lab to be referenced in case.