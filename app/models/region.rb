class Region < ApplicationRecord
    self.primary_key = :code
    has_many :libraries

    validates :name, :code, presence: true

    validates :code, length: { is: 5 }

    # TODO regex pro :code
end
