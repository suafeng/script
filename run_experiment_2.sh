# first argument, train or test. Train is to get the train data.
# second argument, is the number of client

tmux send -t loop 'cd /home/tdai1/ottertune/client/driver' ENTER
tmux send -t loop 'sudo fab run_loops:max_iter=100' ENTER

if [ $1 = "train" ]
then
    tar -C /home/tdai1/results/ -cvzf /home/tdai1/$1_client_$2_batch_100_result.tar .
else
    tar -C /home/tdai1/results/ -cvzf /home/tdai1/test_client_$2_batch_100_result.tar .
fi

sudo rm /home/tdai1/results/*