#!/bin/bash

# Tech and Me © - 2017, https://www.techandme.se/

# shellcheck disable=2034,2059
true
# shellcheck source=lib.sh
. <(curl -sL https://raw.githubusercontent.com/nextcloud/vm/master/lib.sh)

# Check for errors + debug code and abort if something isn't right
# 1 = ON
# 0 = OFF
DEBUG=0
debug_mode

crontab -u www-data -l | { cat; echo "*/15  *  *  *  * php $NCPATH/occ preview:pre-generate"; } | crontab -u www-data -

# Download and install previewgenerator
echo "Installing preview generator..."
git clone "https://github.com/rullzer/previewgenerator.git" "$NCPATH/apps/previewgenerator"

# Enable previewgenerator
if [ -d "$NCPATH"/apps/previewgenerator ]
then
    sudo -u www-data php "$NCPATH"/occ app:enable previewgenerator
fi
