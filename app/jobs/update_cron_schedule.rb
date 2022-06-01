# frozen_string_literal: true

class UpdateCronSchedule < ApplicationJob
  queue_as :urgent

  def perform
    Scheduler.regenerate_schedule
  end
end
