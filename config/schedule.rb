# frozen_string_literal: true

require File.expand_path('../environment', __FILE__) # requiring rails application to have access to models

set :output, 'log/cron.log' unless Rails.env.production?
set :environment, Rails.env

env 'ENABLE_UPTIME_DATABASE_USERNAME', 'postgres'
env 'ENABLE_UPTIME_DATABASE_PASSWORD', ''

MonitoredService.all.each do |monitored_service|
  every monitored_service.schedule do
    runner "ServiceAvaliabilityCheck.perform_later(#{monitored_service.id})"
  end
end
