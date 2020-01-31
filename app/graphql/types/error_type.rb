module Types
  class ErrorType < Types::BaseObject
    description 'An acive record error for GraphQL'

    field :field_name, String, null: false, camelize: false
    field :errors, [String], null: false
  end
end