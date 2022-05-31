# frozen_string_literal: true

class CreateMonitoredServicesRecipients < ActiveRecord::Migration[7.0]
  def change
    create_table :monitored_services_recipients do |t|
      t.integer :monitored_service_id, null: false
      t.integer :recipient_id, null: false

      t.timestamps
    end
  end
end
