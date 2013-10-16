require 'bundler/capistrano'
require 'rvm/capistrano'
require 'capistrano-unicorn'

load 'config/recipes/base'
load 'config/recipes/config'

server '<<Your server IP>>', :web, :app, :db, primary: true

set :user, 'ubuntu'
set :application, 'blog'
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :copy
set :repository,  '.'
#set :deploy_via, :remote_cache
set :use_sudo, false

#set :scm, 'git'
#set :repository, 'git@github.com:ryanb/#{application}.git'
#set :branch, 'master'

default_run_options[:pty] = true
#ssh_options[:forward_agent] = true


set :rvm_ruby_string, :local              # use the same ruby as used locally for deployment
set :rvm_autolibs_flag, 'read-only'       # more info: rvm help autolibs

after 'deploy', 'deploy:cleanup' # keep only the last 5 releases
before 'deploy:restart', 'config:unicorn'
after 'deploy:restart', 'unicorn:duplicate'
