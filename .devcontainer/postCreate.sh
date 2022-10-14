#!/usr/bin/env sh

set -o errexit
set -o xtrace

# This creates some files that are needed for GPG agent forwarding to work
# locally. If those files aren't created then forwarding the GPG agent socket
# over ssh fails.
gpg -k

# Make sure GPG agent forwarding works: https://wiki.gnupg.org/AgentForwarding
# This can not be run in the Dockerfile because the ssh daemon is installed
# afterwards by the sshd dev container "feature". Therefore, the ssh
# daemon/service is not installed and available when the Dockerfile is running.
sudo sh -c 'echo "StreamLocalBindUnlink yes" >> /etc/ssh/sshd_config'
sudo service ssh reload
sudo service ssh restart

exec sh install.sh
