# frozen_string_literal: true

# == Schema Information
#
# Table name: check_results
#
#  id                   :bigint           not null, primary key
#  avaliable            :boolean          default(FALSE), not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  monitored_service_id :bigint           not null
#
# Indexes
#
#  index_check_results_on_monitored_service_id  (monitored_service_id)
#
# Foreign Keys
#
#  fk_rails_...  (monitored_service_id => monitored_services.id)
#
class CheckResult < ApplicationRecord
  belongs_to :monitored_service
end
