# frozen_string_literal: true

class AddSignInFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :email, :string
    add_column :users, :password_digest, :string
    add_column :users, :role, :integer
  end
end
