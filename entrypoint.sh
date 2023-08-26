#!/bin/bash
set -e

trap shutdown HUP INT QUIT TERM

function shutdown() {
  echo "stopping"

  kill -SIGTERM -1
}

if [ -z "$1" ]; then
  cd rails_app
  bundle install -j4 --retry 3 --quiet
  # use custom pid file to avoid collision with the jupyter lab server
  rails s -b 0.0.0.0 -d -P /tmp/server.pid
  cd ..
  rake -f rails_app/Rakefile jupyter:lab
else
  cd rails_app
  exec "$@"
fi
