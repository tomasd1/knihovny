class City < ApplicationRecord
    self.primary_key = :code
    has_many :libraries

    validates :name, :code, presence: true

    validates :code, length: { maximum: 6 }
    validates :code, numericality: { only_integer: true }

    validates :name, length: { maximum: 50 }
end
