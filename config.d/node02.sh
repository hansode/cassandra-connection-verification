#!/bin/bash
#
# requires:
#  bash
#
set -e
set -o pipefail
set -x

# Do some changes ...

curl -fsSkL https://raw.githubusercontent.com/axsh/wakame-vdc/master/rpmbuild/wakame-vdc.repo -o /etc/yum.repos.d/wakame-vdc.repo
yum install --disablerepo=updates wakame-vdc-ruby
