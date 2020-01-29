# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  body       :string
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

module Types
  class PostInputType < GraphQL::Schema::InputObject
    graphql_name 'PostInputType'
    description "All the attributes for creating a new post"

    argument :id, ID, required: false
    argument :body, String, required: false
    argument :user_id, Int, required: true, camelize: false
    
  end

  class PostType < Types::BaseObject
    description 'Post Type'

    field :id, ID, null: false
    field :body, String, null: true

    field :comments, [Types::CommentType], null: true
  end
end
