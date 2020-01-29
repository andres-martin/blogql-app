# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :create_user, Types::UserType, mutation: Mutations::CreateUser,
                               description: 'A method to create a new User'

    field :update_user, Boolean, null: false, description: "Update an user" do
      argument :user, Types::UserInputType, required: true
    end

    def update_user(user:)
      existing = User.where(id: user[:id]).first
      existing&.update_attributes user.to_h
    end

    field :delete_user, Boolean, null: false, description: "Delete an user" do
      argument :id, ID, required: true
    end

    def delete_user(id:)
      User.where(id: id).destroy_all
      true
    end
  end
end
