# frozen_string_literal: true

class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.string :key, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    # change_column_null :sessions, :key, false
  end
end
