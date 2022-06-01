# frozen_string_literal: true

class ServiceAvaliabilityCheck < ApplicationJob
  queue_as :default

  def perform(monitored_service_id)
    monitored_service = MonitoredService.find(monitored_service_id)
    is_avaliable = perform_check(monitored_service.url)

    record_result(monitored_service, is_avaliable)
  end

  private

  def perform_check(url)
    AvaliabilityChecker.new(url).check
  end

  def record_result(monitored_service, is_avaliable)
    CheckResult.create(monitored_service: monitored_service, avaliable: is_avaliable)
  end
end
