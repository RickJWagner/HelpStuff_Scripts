#!/bin/bash

# get $JBOSS_HOME
JBOSS_HOME=$1
# echo $1

# var for session name (to avoid repeated occurences)
sn=mysession

# Start the session and window 0 in /etc
#   This will also be the default cwd for new windows created
#   via a binding unless overridden with default-path.
cd $JBOSS_HOME 
tmux new-session -s "$sn" -n JBossHome -d

cd bin
tmux new-window -t "$sn:2" -n "Bin"

cd ../standalone/deployments
tmux new-window -t "$sn:3" -n "Deploy"

cd ../../quickstarts
tmux new-window -t "$sn:4" -n "QS"

cd ~/Support
tmux new-window -t "$sn:5" -n "Support"

# Create a bunch of windows in /var/log
# cd /var/log
# for i in {1..6}; do
#     tmux new-window -t "$sn:$i" -n "var$i"
# done

# Set the default cwd for new windows (optional, otherwise defaults to session cwd)
#tmux set-option default-path /

# Select window #1 and attach to the session
tmux select-window -t "$sn:1"
tmux -2 attach-session -t "$sn"
