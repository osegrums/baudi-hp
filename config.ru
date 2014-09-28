# This file is used by Rack-based servers to start the application.

if ENV['RAILS_ENV'].to_s.downcase == 'production'
  require 'puma_worker_killer'

  PumaWorkerKiller.config do |config|
    config.ram = 256 # mb
    config.frequency = 10 # seconds
    config.percent_usage = 0.98
  end

  PumaWorkerKiller.start
end

require ::File.expand_path('../config/environment',  __FILE__)
run Rails.application
