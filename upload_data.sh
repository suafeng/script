#! /bin/bash

# first argument, train or test
# second argument, number of client
# third argument, number of iteration

# remove everything in upload_output before
sudo rm /home/tdai1/ottertune/client/controller/upload_output/*
if [ $1 = "train" ]
then
    tar -xvzf /home/tdai1/$1_client_$2_batch_$3_result.tar -C /home/tdai1/ottertune/client/controller/upload_output
else
    tar -xvzf /home/tdai1/test_client_$2_batch_$3_result.tar -C /home/tdai1/ottertune/client/controller/upload_output
fi

cd /home/tdai1/ottertune/client/driver
fab upload_dbms_results
cd -
sudo rm /home/tdai1/ottertune/client/controller/upload_output/*
