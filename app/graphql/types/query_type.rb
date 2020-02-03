# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :users, [Types::UserType], null: false,
                                     description: 'An array of all  users in db'
    def users
      User.all
    end

    field :posts, [Types::PostType], null: false, description: 'An array of all posts stored in the db'

    # posts = -> { Post.all }
    def posts
      Post.all
    end

    field :comments, [Types::CommentType], null: false, description: 'An array of all comments stored in the db'

    def comments
      Comment.all
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

    field :login, String, null: true, description: 'Login a User' do
      argument :email, String, required: true
      argument :password, String, required: true
    end

    def login(email:, password:)
      if user = User.where(email: email).first&.authenticate(password)
        user.sessions.create.key
      end
    end

    field :current_user, Types::UserType, null: true, description: 'Currently logged in User'

    def current_user
      context[:current_user]
    end

    field :logout, Boolean, null: false

    def logout
      session = Session.where(id: context[:session_id]).first
      if session&.destroy
        true
      else
        false
      end
    end
  end
end
