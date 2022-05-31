# frozen_string_literal: true

class Recipient < ApplicationRecord
  has_and_belongs_to_many :monitored_services
end
