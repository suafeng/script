sudo sysctl -w vm.dirty_background_ratio=10
sudo sysctl -w vm.dirty_ratio=20
sudo sysctl -w vm.swappiness=60
sudo sysctl -w vm.dirty_expire_centisecs=3000
sudo sysctl -w vm.dirty_writeback_centisecs=500
sudo sysctl -w kernel.sched_migration_cost_ns=500000