#!/bin/sh


# Generate new default key pair
generate_default_sshkey() {
	if [ ! -e ~/.ssh/id_rsa ]; then
		ssh-keygen -t rsa -f ~/.ssh/id_rsa
		ssh-add ~/.ssh/id_rsa
	fi
}

# Generate work key pair
generate_additional_sshkey() {
	key_name="$1"
	comment="${2:-Key for $1}"

	key_path="${HOME}/.ssh/${key_name}"

	ssh-keygen -t rsa -f "${key_path}" -C "$comment"
	ssh-add "${key_path}"
}

configure_default_sshkey() {
	touch ~/.ssh/config
	cat <<EOF >> ~/.ssh/config
Host bitbucket.org
  HostName bitbucket.org
  IdentityFile ~/.ssh/id_rsa

Host github.com
  HostName github.com
  IdentityFile ~/.ssh/id_rsa

EOF

}

configure_additional_sshkey() {
	key_name="$1"
	host="$2"
	hostname="$3"

	touch ~/.ssh/config
	cat <<EOF >> ~/.ssh/config
Host ${host}
  HostName ${hostname}
  IdentityFile ~/.ssh/${key_name}

EOF

}


generate_default_sshkey
configure_default_sshkey

generate_additional_sshkey  "iti" "Key for ITI"
configure_additional_sshkey "iti" "itinnovate.bitbucket.org" "bitbucket.org"

