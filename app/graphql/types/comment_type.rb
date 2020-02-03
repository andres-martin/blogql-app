# frozen_string_literal: true

# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :string
#  post_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

module Types
  class CommentInputType < GraphQL::Schema::InputObject
    graphql_name 'CommentInputType'
    description 'All the attributes for creating a new comment'

    argument :id, ID, required: false
    argument :body, String, required: false
    argument :post_id, Int, required: true, camelize: false
  end

  class CommentType < Types::BaseObject
    description 'Comment Type'

    field :id, ID, null: false
    field :body, String, null: true
  end
end
