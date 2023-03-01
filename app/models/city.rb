class City < ApplicationRecord
    self.primary_key = :code
    has_many :libraries
end
