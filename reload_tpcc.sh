# drop old tpcc database, load again
PGPASSWORD=tdai1 dropdb -e --if-exists tpcc -U tdai1
PGPASSWORD=tdai1 createdb -e tpcc -U tdai1

tmux new -d -s longrun
tmux send -t longrun "cd /home/tdai1" ENTER
tmux send -t longrun "gunzip -c ~/s500_dump_tpcc.gz | psql tpcc && exit" ENTER