rails_env  = ENV['RAILS_ENV']  || 'production'
rails_root = ENV['RAILS_ROOT'] || File.expand_path('../../', __FILE__)

# Additional text to display in process listing
tag "baudi #{rails_env}"

# Set the environment in which the rack's app will run.
environment rails_env

# How many worker processes to run.
workers 2

# Configure “min” to be the minimum number of threads to use to answer
# requests and “max” the maximum.
threads 2,2

# Use “path” as the file to store the server info state. This is
# used by “pumactl” to query and control the server.
state_path "#{rails_root}/tmp/sockets/puma.state"

# Listen on a Unix data socket
bind "unix://#{rails_root}/tmp/sockets/puma.sock"

# Daemonize the server into the background. Highly suggest that
# this be combined with “pidfile” and “stdout_redirect”.
daemonize true
pidfile ENV['PID_FILE']

# Redirect STDOUT and STDERR to files specified. The 3rd parameter
# (“append”) specifies whether the output is appended, the default is
# “false”.
stdout_redirect \
  "#{rails_root}/log/puma.stdout.log",
  "#{rails_root}/log/puma.stderr.log",
  true

# Allow workers to reload bundler context when master process is issued
# a USR1 signal. This allows proper reloading of gems while the master
# is preserved across a phased-restart. (incompatible with preload_app)
# (off by default)
prune_bundler

# Puma control rack application
activate_control_app "unix://#{rails_root}/tmp/sockets/pumactl.sock", no_token: true
