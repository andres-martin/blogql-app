# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  first_name      :string
#  last_name       :string
#  street          :string
#  number          :integer
#  city            :string
#  postcode        :string
#  country         :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  email           :string
#  password_digest :string
#  role            :integer
#

class User < ApplicationRecord
  has_secure_password

  has_many :posts, dependent: :destroy
  has_many :sessions, dependent: :destroy
  enum role: { member: 0, admin: 1 }
  validates :first_name, presence: true
  validates :number, numericality: { only_integer: true }

  def full_address
    [street, number, city, postcode, country].compact.join ' '
  end

  def has_role?(role)
    self.role == role
  end
end
