class City < ApplicationRecord
    self.primary_key = :kod_obce
    # has_many :libraries, primary_key: :kod_obce, foreign_key: 'book_isbn'
    has_many :libraries
end
