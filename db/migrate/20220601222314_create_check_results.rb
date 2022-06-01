# frozen_string_literal: true

class CreateCheckResults < ActiveRecord::Migration[7.0]
  def change
    create_table :check_results do |t|
      t.boolean :avaliable, null: false, default: false
      t.references :monitored_service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
