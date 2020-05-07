#!/usr/bin/env bash

sudo yum -y install python-virtualenv gcc openssl-devel libffi-devel gmp-devel ncurses-devel java
sudo yum list available nmap && sudo yum -y install nmap
git clone git@github.mtv.cloudera.com:QE/deploy.git
cd deploy
make install

# shortcut script to import tpcds_100_decimal_parquet
cat <<EOF > import_tpcds.sh
#!/usr/bin/env bash

./target/env/bin/cdep_generate_tpc_data --manager rizasuminto-1.vpc.cloudera.com \
    --tpc-database tpcds_100_decimal_parquet copy_tpc
EOF
chmod +x import_tpcds.sh

