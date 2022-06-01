# frozen_string_literal: true

class Scheduler
  class << self
    def regenerate_schedule
      `bundle exec whenever --update-crontab`
    end
  end
end
