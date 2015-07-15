environment ENV['RACK_ENV']
threads 0,5

workers 3
preload_app!

on_worker_boot do
  require 'newrelic_rpm'
  NewRelic::Agent.manual_start

  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end