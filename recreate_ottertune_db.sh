# stop current job in those tmux sessions.
tmux send -t website C-c
tmux send -t celerybeat C-c
tmux send -t celeryworker C-c

# don't run this script using sudo
mysql -u tdai1 --password=tdai1 -e "drop database ottertune;"
mysqladmin create -u tdai1 --password=tdai1 ottertune
cd /home/tdai1/ottertune/server/website
python3 manage.py makemigrations website 
python3 manage.py migrate 
cd -

# run website, celeryworker and celerybeat

tmux send -t website 'cd /home/tdai1/ottertune/server/website' ENTER
tmux send -t celeryworker 'cd /home/tdai1/ottertune/server/website' ENTER
tmux send -t celerybeat 'cd /home/tdai1/ottertune/server/website' ENTER

tmux send -t website 'python3 manage.py runserver 0.0.0.0:8000' ENTER
tmux send -t celeryworker 'python3 manage.py celery worker --loglevel=info --pool=threads' ENTER
tmux send -t celerybeat 'python3 manage.py celerybeat --verbosity=2 --loglevel=info' ENTER
