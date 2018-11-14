#! /bin/bash

echo "Begin to set tunable kernel knobs to their default values"
sudo ./set_kernel_start_point.sh
echo "Finished setting kernel knobs"
# may not need to recreate the ottertune db. When we only
# change the value of client, no need. But still recreate it anyway

# remove all results in current results folder (/home/tdai1/results)
sudo rm /home/tdai1/results/*

echo "Begin to reset ottertune"
./recreate_ottertune_db.sh
echo "Finished resetting ottertune"

echo "Begin to load tpcc database in background"
./reload_tpcc.sh
sudo fstrim /

# after above all this, log into the website and create the session you need,
# and set the upload code in driver_config
echo "All initialization complete. Please create session on website and setup upload code."
echo "After tpcc is loaded (check if there is a tmux session called longrun), run run_experiment_2.sh"