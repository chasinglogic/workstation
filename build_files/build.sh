#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# Install the base packages I want on my system
dnf5 install -y neovim fish

# Needed by mise to build most tools
sudo dnf5 install -y @c-development

# Requirements for building Ruby
sudn dnf5 install -y libyaml-devel libffi-devel

dnf5 -y copr enable scottames/ghostty
dnf5 -y install ghostty

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket
systemctl enable docker.service
