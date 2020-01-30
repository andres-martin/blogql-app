# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :users, [Types::UserType], null: false,
                               description: 'An array of all  users in db'
    def users
      User.all
    end

    field :posts, [Types::PostType], null: false, description: "An array of all posts stored in the db"

    # posts = -> { Post.all }
    def posts
      Post.all
    end

    field :user, Types::UserType, null: true, description: 'User Type' do # root
      argument :id, ID, required: true
    end

    field :post, Types::PostType, null: true, description: 'Post Type' do
      argument :id, ID, required: true
    end

    field :comment, Types::CommentType, null: true, description: 'Comment Type' do
      argument :id, ID, required: true
    end

    def user(id:)
      User.where(id: id).first
    end

    def post(id:)
      Post.where(id: id).first
    end

    def comment(id:)
      Comment.where(id: id).first
    end
  end
end
