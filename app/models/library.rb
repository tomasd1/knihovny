class Library < ApplicationRecord
  # belongs_to :region, foreign_key: 'kod_vusc'
  # belongs_to :district, foreign_key: 'kod_okresu'
  # belongs_to :orp, foreign_key: 'kod_orp'
  # belongs_to :city, foreign_key: 'kod_obce'
  belongs_to :region, foreign_key: 'lib_region'
  belongs_to :district, foreign_key: 'lib_district'
  belongs_to :orp, foreign_key: 'lib_orp'
  belongs_to :city, foreign_key: 'lib_city'
end
