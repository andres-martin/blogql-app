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

    field :create_post, Types::PostType, mutation: Mutations::CreatePost

    field :update_post, Boolean, null: false, description: "Update a post" do
      argument :post, Types::PostInputType, required: true
    end

    def update_post(post:)
      existing = Post.where(id: post[:id]).first
      existing&.update_attributes post.to_h
    end

    field :delete_post, Boolean, null: false, description: "Delete a post" do
      argument :id, ID, required: true
    end

    def delete_post(id:)
      record = Post.where(id: id).first
      success = record&.destroy
      success = success ? true : false
    end
  end
end
