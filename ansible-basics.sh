#default inventory file
/etc/ansible/hosts


#check ansible inventory file
ansible-inventory -i inventory --list

#check ansible cfg file:
[sysops@CM01 ansible]$ ansible --version
ansible 2.9.27
  config file = /home/sysops/ansible/ansible.cfg
  configured module search path = ['/home/sysops/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3.6/site-packages/ansible
  executable location = /usr/bin/ansible
  python version = 3.6.8 (default, Nov  9 2021, 14:44:26) [GCC 8.5.0 20210514 (Red Hat 8.5.0-3)]

#check what changed in custom configuration file
ansible-config dump --only-changed

#check all modules avaible for ansible
ansible-doc -l

#check ping to all hosts in inventory
ansible all -m ping 

#check ping with providing password for only one host from inventory 
ansible all --limit cc01  -m ping -k

#ansible adhoc command examples
#restart sshd for all hosts
ansible all -m service -a "state=restarted name=sshd"

#add user test for webservers hosts
ansible all -m service -a "state=restarted name=sshd"


#check playbook syntax
ansible-playbook --syntax-check playbook.yml

#dry run playbook
ansible-playbook -C playbook.yml

#override variable in ansible playbook 
ansible-playbook --syntax-check playbook.yml

#how to use ansible vault for secret password
ansible-playbook --ask-vault-pass example3.yml 

#encrypt vult
ansible-vault encrypt secretfile
#decrypt vault 
ansible-vault decrypt secretfile
#change the password of vault
ansible-vault rekey secretfile

#gather all facts from host
ansible <hostname> -m ansible.builtin.setup