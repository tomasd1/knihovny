class District < ApplicationRecord
    self.primary_key = :code
    has_many :libraries

    validates :name, :code, presence: true
    validates :code, length: { is: 6 }
    validates :code, format: { with: /^CZ\d{4}$/,
        message: "Must start with CZ followed by 4 digits, example: CZ1234" }
    validates :name, length: { maximum: 50 }
end
