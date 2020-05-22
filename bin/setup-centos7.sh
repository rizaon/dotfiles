#!/usr/bin/env bash

# setup git
sudo yum -y remove git*
sudo yum -y install  https://repo.ius.io/ius-release-el7.rpm
sudo yum -y install  git222
git --version

# install some tools
sudo yum -y install vim htop tmux zsh

# install dotfiles
cd ~/
git clone https://github.com/rizaon/dotfiles.git
cd dotfiles
./install

# change shell
sudo sed -i "s|/home/$USER:/bin/bash|/home/$USER:/bin/zsh|g" /etc/passwd

# setup known_hosts fingerprint
cat <<EOF >> ~/.ssh/known_hosts
# github.infra.cloudera.com:22 SSH-2.0-babeld-942fac04
github.infra.cloudera.com ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBIq4UUb+wKlwGnAoh04gzbGf63xOb1Sczuf2G6Sr4WoLm9a6cfEwspS1xi8k9TYyRYJZ90tnhLDCTrS0ZECyX4s=
# github.infra.cloudera.com:22 SSH-2.0-babeld-942fac04
github.infra.cloudera.com ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDS8MYKux6L+l9g6yZSTnMz+YA76YSqXgiziZ85Ner5EpMLLBsgRhi1riDQbea8sHxA6I9pqb1H7fudvBLMbUpQqRTVQA07d2GPYqINg8x6lo9nKCuajQIRpxJNv3ysH+T7CLC79Q8Kxwjx5rdrxmX6P7nRhCYkwAoG0w7BcpyfoW67Y4YM04SIlThC4K0o3UVgCUM8L/KeFCC0JaVbcUF4UlXnEAsYhs2nF3/l6HVcv1ydxvrx6eDU3CJWqdVTK80puNSKMC9NtohfE0yu1iyC04IFV+1ncS5tptu+AmsjLcQ9gm0XjVy0SPUSVsyOgQQRWN760AwAlda60KfLo7i7
EOF

