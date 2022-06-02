# frozen_string_literal: true

# == Schema Information
#
# Table name: settings
#
#  id                         :bigint           not null, primary key
#  monitoring_service_enabled :boolean          default(FALSE)
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#
class Settings < ApplicationRecord
  class << self
    def monitoring_service_enabled
      settings_instance.monitoring_service_enabled
    end

    def monitoring_service_enabled=(value)
      settings_instance.update(monitoring_service_enabled: value)
    end

    private

    def settings_instance
      find_or_create_by(id: 1)
    end
  end
end
