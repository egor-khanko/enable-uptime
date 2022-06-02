# frozen_string_literal: true

class API::Resources::Settings < Grape::API
  helpers do
    def update_cron_schedule
      UpdateCronSchedule.perform_later
    end
  end

  namespace :settings do
    post :enable_service do
      Settings.monitoring_service_enabled = true
      update_cron_schedule

      body false
    end

    post :disable_service do
      Settings.monitoring_service_enabled = false
      update_cron_schedule

      body false
    end
  end
end
