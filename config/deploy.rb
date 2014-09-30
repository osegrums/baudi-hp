require "dotenv/capistrano"

# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'baudi-hp'
set :repo_url, 'git@github.com:osegrums/baudi-hp.git'

set :scm, :git
set :repository_cache, "git_cache"
set :deploy_via, :remote_cache
set :copy_exclude, [".git", "public/images/*.psd"]
# set :shared_children, fetch(:shared_children) + ['tmp/sockets', 'tmp/cache']

set :use_sudo, false
set :group_writable, false
set :normalize_asset_timestamps, false

env_default = {
  path: "/opt/rubies/ruby-2.1.3/bin:$PATH"
}
set :default_env, env_default

# Default value for linked_dirs is []
set :linked_dirs, %w{pids bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
# set :deploy_to, '/var/www/my_app'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}


# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  desc 'Start application'
  task :start do
    on roles(:app), in: :sequence, wait: 15 do
      execute :bash, "-c 'cd #{current_path} && BUNDLE_GEMFILE=#{current_path}/Gemfile RAILS_ROOT=#{current_path} PID_FILE=#{shared_path}/pids/puma.pid RAILS_ENV=production bundle exec puma -C config/puma.rb'"
    end
  end

  desc 'Stop application'
  task :stop do
    on roles(:app), in: :sequence, wait: 15 do
      execute :kill, "-s QUIT `cat #{shared_path}/pids/puma.pid`"
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 15 do
      execute :kill, "-s USR1 `cat #{shared_path}/pids/puma.pid`"
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
