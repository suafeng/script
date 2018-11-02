#! /bin/bash

sudo ./set_kernel_default.sh
# may not need to recreate the ottertune db. When we only
# change the value of client, no need. But still recreate it anyway
./recreate_ottertune_db.sh

./reload_tpcc.sh
sudo fstrim /

# after above all this, log into the website and create the session you need,
# and set the upload code in driver_config
echo "All initialization complete. Please create session on website and setup upload code."
echo "Then run run_experiment_2.sh"