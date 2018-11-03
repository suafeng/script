# argument:
# $1: train or test
# $2: client number
# $3: number of iteration

if [ $1 = "train" ]
then
    tar -C /home/tdai1/results/ -cvzf /home/tdai1/$1_client_$2_batch_$3_result.tar .
else
    tar -C /home/tdai1/results/ -cvzf /home/tdai1/test_client_$2_batch_$3_result.tar .
fi

sudo rm /home/tdai1/results/*
echo "Finished"