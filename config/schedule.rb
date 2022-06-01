# frozen_string_literal: true

require File.expand_path('../environment', __FILE__) # requiring rails application to have access to models

set :output, 'log/cron.log' unless Rails.env.production?

MonitoredService.all.each do |monitored_service|
  every monitored_service.schedule do
    runner "ServiceAvaliabilityCheck.perform_later(#{monitored_service.id})"
  end
end