# frozen_string_literal: true

class CreateMonitoredServices < ActiveRecord::Migration[7.0]
  def change
    create_table :monitored_services do |t|
      t.string :url, null: false
      t.string :schedule, null: false

      t.timestamps
    end
  end
end
