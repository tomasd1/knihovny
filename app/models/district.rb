# frozen_string_literal: true

class District < ApplicationRecord
  self.primary_key = :code
  has_many :libraries

  validates :name, :code, presence: true
  validates :code, length: { is: 6 }
  validates :code, format: { with: /\ACZ\d{4}\z/,
                             message: 'Must start with CZ followed by 4 digits, example: CZ1234' }
  validates :name, length: { maximum: 50 }
end
