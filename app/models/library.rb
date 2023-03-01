class Library < ApplicationRecord
  belongs_to :region
  belongs_to :district
  belongs_to :orp
  belongs_to :city
end
