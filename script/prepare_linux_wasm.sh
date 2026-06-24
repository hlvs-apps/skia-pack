#!/bin/bash
set -o errexit -o nounset -o pipefail

export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get install binutils build-essential -y
apt-get install software-properties-common -y
apt-get install python3 git curl wget -y
# Install system ninja: the container's Python 3.8 can't run depot_tools' ninja.py
# wrapper (it uses list[str] type hints), so build.py needs a real ninja binary.
apt-get install ninja-build -y