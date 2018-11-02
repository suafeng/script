#! /bin/bash

# first argument, train or test
# second argument, number of client

# need to change 

if [ $1 = "train" ]
then
    tar -xvzf /home/tdai1/$1_client_$2_batch_100_result.tar -C /home/tdai1/ottertune/client/controller/upload_output
else
    tar -xvzf /home/tdai1/test_client_$2_batch_100_result.tar -C /home/tdai1/ottertune/client/controller/upload_output
fi

cd /home/tdai1/ottertune/client/driver
fab upload_dbms_results
cd -
sudo rm /home/tdai1/ottertune/client/controller/upload_output/*