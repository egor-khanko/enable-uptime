# frozen_string_literal: true

class ServiceAvaliabilityCheck < ApplicationJob
  queue_as :default

  def perform(monitored_service_id)
    monitored_service = MonitoredService.find(monitored_service_id)

    check_result = perform_check(monitored_service.url)
  end

  private

  def perform_check(url)
    AvaliabilityChecker.new(url).check
  end
end
