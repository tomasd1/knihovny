# frozen_string_literal: true

# Region
class Region < ApplicationRecord
  self.primary_key = :code
  has_many :libraries

  validates :name, :code, presence: true
  validates :code, length: { is: 5 }
  validates :code, format: { with: /\ACZ\d{3}\z/,
                             message: 'Must start with CZ followed by 3 digits, example: CZ123' }
end
