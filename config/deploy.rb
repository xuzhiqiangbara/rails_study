# #アプリケーション名
# set :application,'xu.zhiqiangtest'
# #レポジトリURL
# set :repo_url, 'git@github.com:xuzhiqiangbara/rails_study.git'
# #対象ブランチ masterに固定
# set :branch, 'master'
# #デプロイ先ディレクトリ フルパスで指定
# set :deploy_to, '/home/rails_study/rails_study/demo'
# #バージョン管理方法 subverion, git, mercurial, cvs, bzrなど
# set :scm, :git
# #情報レベル info or debug
# set :log_level, :debug
# #sudoに必要 これをtrueにするとssh -tで実行される
# set :pty, true
# #sharedに入るものを指定
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets bundle public/system public/assets}
# #capistrano用bundleするのに必要
# set :default_env, { path: "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH" }
# #5回分のreleasesを保持する
# set :keep_releases, 2 

#----------------------------

set :application, 'myapp'
set :repo_url, 'git@github.com:xuzhiqiangbara/rails_study.git'
set :branch, 'master'
set :deploy_to, '/home/rails_study/rails_study/demo'
set :scm, :git
# set :log_level, :debug
set :format, :pretty
set :log_level, :info
set :pty, true
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets bundle public/system public/assets}
set :default_env, { path: "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH" }
set :keep_releases, 3


set :rbenv_type, :user
set :rbenv_ruby, '2.2.0'
set :rbenv_path, '~/.rbenv'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do

  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end
end


