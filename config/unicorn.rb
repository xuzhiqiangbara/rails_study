#app_path = File.expand_path(File.dirname(__FILE__) + '/..')

app_path = '/home/rails_study/rails_study/demo'
working_directory app_path + "/current"


worker_processes 2

working_directory app_path
timeout 30

#listen
#socket_file = app_path + '/tmp/unicorn_rails_study.sock'
socket_file = app_path + '/shared/tmp/sockets/unicorn_rails_study.sock'
listen 8080, tcp_nopush: false
listen socket_file, backlog: 64


#Pid 
#pid app_path + '/tmp/unicorn_rails_study.pid' 
pid app_path + '/shared/tmp/pids/unicorn_rails_study.pid' 

#log
log_file = app_path + '/current/log/unicorn.log' 
err_log  = app_path + '/current/log/unicorn_error.log'

stderr_path err_log
stdout_path log_file


#Preload
preload_app true

#GC
GC.respond_to?(:copy_on_write_friendly=) and GC.copy_on_write_friendly = true


#Before_forc
before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!

  old_pid = "#{ server.config[:pid] }.oldbin"
  unless old_pid == server.pid
     begin
       sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
       Process.kill :QUIT, File.read(old_pid).to_i
       rescue Errno::ENOENT, Errno::ESRCH
     end
   end
end

#After_fork
after_fork do |server, worker|
    defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end

