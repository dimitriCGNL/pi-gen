#!/bin/bash

# Command to be executed on every reboot
COMMAND_TO_RUN="@reboot /home/contrailpi/autoUpdate.sh"

# Add the command to the crontab
(crontab -l 2>/dev/null; echo "$COMMAND_TO_RUN") | crontab -

COMMAND_TO_RUN="0 0 * * * /home/contrailpi/autoUpdate.sh"

# Add the command to the crontab
(crontab -l 2>/dev/null; echo "$COMMAND_TO_RUN") | crontab -

cd /home/contrailpi/

git clone https://github.com/contrailcirrus/contrail-cameras.git

bash /home/contrailpi/autoUpdate.sh