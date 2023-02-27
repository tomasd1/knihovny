class Orp < ApplicationRecord
    self.primary_key = :kod_orp
    has_many :libraries
end
