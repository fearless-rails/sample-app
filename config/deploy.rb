set :application, 'sample-app'
set :repo_url, 'https://github.com/XORangeJuice/sample-app.git'

set :deploy_to, '/home/deploy/sample-app-auto'

set :branch, 'master'

set :scm, :git

# set :format, :pretty
# set :log_level, :debug
# set :pty, true

set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/assets}

set :rvm_type, :system
set :ruby, '2.0.0-p247'

set :rails_env, 'production'

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
# set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute "cd #{current_path} && kill -USR2 `cat tmp/pids/unicorn.pid`"
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup'

end
