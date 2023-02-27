class Region < ApplicationRecord
    self.primary_key = :kod_vusc
    has_many :libraries
end
