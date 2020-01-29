# frozen_string_literal: true

module Types
  class CommentType < Types::BaseObject
    description 'Comment Type'

    field :id, ID, null: false
    field :body, String, null: true
  end
end
