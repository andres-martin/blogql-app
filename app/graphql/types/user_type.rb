# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  first_name :string
#  last_name  :string
#  street     :string
#  number     :integer
#  city       :string
#  postcode   :string
#  country    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Types::UserType < Types::BaseObject
  description 'User types'

  field :id, ID, null: false
  field :first_name, String, null: true, camelize: false
  field :last_name, String, null: true, camelize: false
  field :street, String, null: true
  field :number, Int, null: true
  field :city, String, null: true
  field :postcode, String, null: true
  field :country, String, null: true

  field :posts, [Types::PostType], null: false
  field :full_address, String, null: false, description: 'A concatenation of full address'

  # field :address, String, null: true, description: "A concatenation of the present address components"

  # # We intentionally exclude any address component that is nil, empty or made only of whitespaces
  # # and we join the rest using a comma.
  # def address
  #   ([:street, :number, :postcode, :city, :country].map do |a|
  #     object.send(a)&.strip
  #   end.compact - ['']).join(', ')
  #  end
end
