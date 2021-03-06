#!/bin/bash
#
# requires:
#  bash
#
set -e
set -o pipefail
set -x

function yum() {
  $(type -P yum) --disablerepo=updates "${@}"
}

# Add installation packages ...
addpkgs="
 gcc-c++
 mysql-devel
"

if [[ -n "$(echo ${addpkgs})" ]]; then
  yum install -y ${addpkgs}
fi
