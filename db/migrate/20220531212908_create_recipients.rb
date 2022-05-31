# frozen_string_literal: true

class CreateRecipients < ActiveRecord::Migration[7.0]
  def change
    create_table :recipients do |t|
      t.string :email, null: false

      t.timestamps
    end
  end
end
