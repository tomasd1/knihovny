class District < ApplicationRecord
    self.primary_key = :code
    has_many :libraries

    validates :name, :code, presence: true

    validates :code, length: { is: 6 }
    # regex pro :code

    validates :name, length: { maximum: 50 }
end
