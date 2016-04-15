setup-ssh:
	ansible-playbook -i hosts -u ubuntu --private-key=~/.ssh/s6test_shared setup-ssh.yml

setup-ssh-lockdown:
	ansible-playbook -i hosts -u ubuntu --private-key=~/.ssh/s6test_shared setup-ssh-lockdown.yml
