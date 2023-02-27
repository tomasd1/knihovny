class District < ApplicationRecord
    self.primary_key = :kod_okresu
    has_many :libraries
end
