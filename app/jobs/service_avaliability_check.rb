# frozen_string_literal: true

class ServiceAvaliabilityCheck < ApplicationJob
  queue_as :default

  def perform(monitored_service_id)
    log_check_start(monitored_service_id)

    monitored_service = MonitoredService.find(monitored_service_id)
    is_avaliable = perform_check(monitored_service.url)

    record_result(monitored_service, is_avaliable)

    log_check_finish(monitored_service_id)
  end

  private

  def perform_check(url)
    AvaliabilityChecker.new(url).check
  end

  def record_result(monitored_service, is_avaliable)
    CheckResult.create(monitored_service: monitored_service, avaliable: is_avaliable)
  end

  def log_check_start(monitored_service_id)
    Rails.logger.info("Check is starting for MonitoredService id: #{monitored_service_id}")
  end

  def log_check_finish(monitored_service_id)
    Rails.logger.info("Check has completed for MonitoredService id: #{monitored_service_id}")
  end
end
