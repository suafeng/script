mysql -u tdai1 --password=tdai1 -e "drop database tpcc;"
mysql -u tdai1 --password=tdai1 -e "create database tpcc;"

tmux new -d -s longrun
tmux send -t longrun "cd /home/tdai1" ENTER
tmux send -t longrun "gunzip -c ~/s500_dump_tpcc.gz | psql tpcc && exit" ENTER