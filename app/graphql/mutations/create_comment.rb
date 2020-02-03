# frozen_string_literal: true

class Mutations::CreateComment < GraphQL::Schema::Mutation
  argument :comment, Types::CommentInputType, required: true

  def resolve(comment:)
    Comment.create comment.to_h
  end

  def self.accessible?(context)
    context[:current_user]&.has_role? 'member'
  end
end
