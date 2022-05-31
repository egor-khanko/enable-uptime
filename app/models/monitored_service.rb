# frozen_string_literal: true

class MonitoredService < ApplicationRecord
  has_and_belongs_to_many :recipients
end
