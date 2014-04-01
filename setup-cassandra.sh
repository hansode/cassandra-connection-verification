#!/bin/bash
#
# requires:
#  bash
#
set -e
set -x
set -o pipefail

node=node01

vagrant ssh ${node} <<EOS
sudo /etc/init.d/cassandra stop
sleep 3

sudo rm -rf /var/lib/cassandra/commitlog
sudo rm -rf /var/lib/cassandra/data
sudo rm -rf /var/lib/cassandra/saved_caches
sudo mkdir -p /var/lib/cassandra/data/system/schema_columnfamilies
sudo mkdir -p /var/lib/cassandra/data
sudo mkdir -p /var/lib/cassandra/commitlog
sudo chown -R cassandra:cassandra /var/lib/cassandra
sleep 3

sudo /etc/init.d/cassandra start
sleep 3

cassandra-cli -h 127.0.0.1 < /vagrant/files/cassandra_schema.txt
EOS

