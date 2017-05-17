#!/bin/bash

# Tech and Me © - 2017, https://www.techandme.se/

# shellcheck disable=2034,2059
true
# shellcheck source=lib.sh
FIRST_IFACE=1 . <(curl -sL https://raw.githubusercontent.com/nextcloud/vm/master/lib.sh)
unset FIRST_IFACE

# Check for errors + debug code and abort if something isn't right
# 1 = ON
# 0 = OFF
DEBUG=0
debug_mode

cat <<-IPCONFIG > "$INTERFACES"
source /etc/network/interfaces.d/*

# The loopback network interface
auto lo $IFACE
allow-hotplug $IFACE
iface lo inet loopback

# The primary network interface
iface $IFACE inet static

# Best practice is to change the static address
# to something outside your DHCP range.
address $ADDRESS
netmask $NETMASK
gateway $GATEWAY

# This is an autoconfigured IPv6 interface
# iface $IFACE inet6 auto

# Exit and save:	[CTRL+X] + [Y] + [ENTER]
# Exit without saving:	[CTRL+X]

IPCONFIG

exit 0
