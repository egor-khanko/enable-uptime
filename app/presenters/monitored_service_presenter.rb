# frozen_string_literal: true

class MonitoredServicePresenter
  attr_reader :monitored_service

  def initialize(monitored_service)
    @monitored_service = monitored_service
  end

  def present
    {
      id: monitored_service.id,
      url: monitored_service.url,
      schedule: monitored_service.schedule,
      recipients: present_recipients
    }
  end
end
