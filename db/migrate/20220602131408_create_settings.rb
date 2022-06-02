# frozen_string_literal: true

class CreateSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :settings do |t|
      t.boolean :monitoring_service_enabled, default: false

      t.timestamps
    end
  end
end
