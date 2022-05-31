# frozen_string_literal: true

# == Schema Information
#
# Table name: recipients
#
#  id         :bigint           not null, primary key
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Recipient < ApplicationRecord
  has_and_belongs_to_many :monitored_services
end
