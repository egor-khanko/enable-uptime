# frozen_string_literal: true

# == Schema Information
#
# Table name: monitored_services
#
#  id         :bigint           not null, primary key
#  url        :string           not null
#  schedule   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class MonitoredService < ApplicationRecord
  has_and_belongs_to_many :recipients

  after_commit :update_cron_schedule

  private

  def update_cron_schedule
    UpdateCronSchedule.perform_later
  end
end
